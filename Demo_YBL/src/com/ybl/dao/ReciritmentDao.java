package com.ybl.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Category;
import com.ybl.model.Company;
import com.ybl.model.Position;
import com.ybl.model.Reciritment;
import com.ybl.tool.HibernateSessionFactory;

public class ReciritmentDao extends BaseHibernateDao {
	
	public void inser(Reciritment reciritment){
		System.out.println("测试DAO：发布职位信息，插入rec表。。。。。。。");
		super.add(reciritment);
	}
	
	public void deleteRec(Integer id){
		Reciritment reciritment = (Reciritment) super.get(Reciritment.class, id);
		super.delete(reciritment);
	}
	
	public Reciritment selectById(Integer id) {
		return (Reciritment) super.get(Reciritment.class, id);
	}
	
	
	//查询公司ID为comId 发布的 是否有效状态 为isOk的所有 招聘信息
	public List<Reciritment> selectByComIdIsOK(Integer comId, Integer isOk) {
		List<Reciritment> list = new ArrayList<Reciritment>(); //该公司的所有招聘信息集合
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			Company company = (Company) session.get(Company.class, comId);
			Set<Reciritment> set = company.getReciritments();
			if(set!=null){
				for (Reciritment r : set) {
					if(r.getIsOk().equals(isOk)){
						list.add(r);
					}
				}
			} else {
				System.out.println("没找到记录！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
	//查询公司comId最新的i个招聘信息 SendDate
	public List<Reciritment> uSendDateSelectById(Integer userId, int cnt) {
		List<Reciritment> list = new ArrayList<Reciritment>(); //该公司的所有招聘信息集合
		Session session = HibernateSessionFactory.getSession();
		try {
			Company company = (Company) session.get(Company.class, userId); //获取编号为comId的公司
			String hql="from Reciritment r order by r.sendDate desc";
			Query query = session .createQuery(hql);
			//xxxxxxxxxxxxxxxxxxxx
			if(cnt>=3) { //超过三个显示三个
				query.setFirstResult(0);//从第一条记录开始
				query.setMaxResults(3);// 前cnt条数据 0 1 2
			}else {   //没超过三个就显示已有的
				query.setFirstResult(0);//从第一条记录开始
				query.setMaxResults(cnt);// 前cnt条数据 0 1
			}
			
			list = query.list();
			for (Reciritment reciritment : list) {
				System.out.println("发布职位公司的邮箱： " + reciritment.getCompany().getEmail() + "  职位数：" + reciritment.getNum() + "  职位名：" + reciritment.getPosition().getName());
			}
			System.out.println("查询成功！");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	//传入职位编号、isOk状态
	//把编号为id的招聘信息的isOk改为0 updateIsOKById
	public void updateIsOKById(Integer id, Integer isOk) {
		Reciritment reciritment = (Reciritment) super.get(Reciritment.class, id); //获取招聘信息对象
		reciritment.setIsOk(isOk); 
		super.update(reciritment);
	}
	
	/*
	 * 查询的条件有  职位名、公司名						模糊搜索
	 * 			     城市、工作经验、最低学历、工作性质           确切的等于某个值
	 * 			     月薪范围：若传入的月薪范围是[L,R], 某招聘的月薪范围为[l,r],则若  L<=l<r<=R 算满足条件
	 * 			     发布时间：计算当前时间与招聘发布时间的差D，D<=day  算满足条件
	 * 以上条件,若为空代表该条件不做限制
	 * 要做分页
	 */
	//用到的表职位、公司
	public List<Reciritment> findJob(int pageNow, int pagesize,
			Reciritment reciritment) {
		Session session = HibernateSessionFactory.getSession();
		List<Company> clist = new ArrayList<Company>(); //符合条件的职位
		List<Reciritment> rlist = new ArrayList<Reciritment>(); //符合条件的职位
		System.out.println("进入查询功能...");
		String rname = null;
		String cname = null ;
		if(reciritment==null)
			System.out.println("职位信息输入为空!");
		if(reciritment.getPosition()!=null){
			rname = reciritment.getPosition().getName(); //searchName 模糊搜索职位名
			System.out.println("职位名称：" + rname);
		}
		if(reciritment.getCompany()!=null){
			cname = reciritment.getCompany().getName(); //searchName 模糊搜索公司名
			System.out.println("公司名称：" + cname);
		}
		System.out.println("职位名称：" + rname + " 公司名称：" + cname);
		if(rname != null) {
			String hql = "from Reciritment where name like '%"+rname+"%'"; //模糊查询职位名字
			Query query = session.createQuery(hql);
			query.setFirstResult(pagesize*(pageNow-1));
			query.setMaxResults(pagesize);
			rlist = query.list();
		} else {
			String hql = "from Company where name like '%"+cname+"%'"; //模糊查询公司名字
			Query query = session.createQuery(hql);
			System.out.println("11111111111111111111111");
			clist = query.list();
			System.out.println("查询公司名称！");
			int st=pagesize*(pageNow-1);
			int i=0, j=0;
			if(clist != null) {
				for (Company company : clist) {
					j++;
					System.out.println("i = " + i);
					Set<Reciritment> recList = company.getReciritments();
					for (Reciritment rec : recList) {
						i++;
						if(i>st&&i<=st+pagesize){
							rlist.add(rec);
							System.out.println("公司名：" + j +" "+ company.getName()+" 职位名：" +rec.getPosition().getName()+" "+rec.getId());
						}
						if(i>st+pagesize)break;
					}
					if(i>st+pagesize)break;
				}
			}
			else{
				System.out.println("空招聘信息！");
			}
		}
		session.close();
		
		return rlist;
	}

	public int findJobSize(Reciritment reciritment) { 
		Session session = HibernateSessionFactory.getSession();
		List<Reciritment> rlist = new ArrayList<Reciritment>(); //符合条件的职位
		String rname = null;
		String cname = null ;
		if(reciritment==null)
			System.out.println("职位信息输入为空........");
		if(reciritment.getPosition()!=null){
			rname = reciritment.getPosition().getName(); //searchName 模糊搜索职位名
			System.out.println("职位名称：" + rname);
		}
		if(reciritment.getCompany()!=null){
			cname = reciritment.getCompany().getName(); //searchName 模糊搜索公司名
			System.out.println("公司名称：" + cname);
		}
		System.out.println("职位名称：" + rname+"公司名称：" + cname);
		if(rname != null) {
			String hql = "from Reciritment where name like '%"+rname+"%'"; //模糊查询职位名字
			Query query = session.createQuery(hql);
			rlist = query.list();

		} else {
			String hql = "from Company where name like '%"+cname+"%'"; //模糊查询公司名字
			Query query = session.createQuery(hql);
			rlist = query.list();
		}
		session.close();
		return rlist.size();
	}
	
	public static void main(String[] args) {
//		ReciritmentDao dao = new ReciritmentDao();
//		Reciritment reciritment = new Reciritment();
//		List<Reciritment> list = new ArrayList<Reciritment>();
//		list = dao.selectByUserId(16);
//		for (Reciritment r : list) {
//			System.out.println(r.getId() + " " + r.getPosition().getName());
//		}
//		dao.findJobSize(reciritment);
//		Company company = new Company();
//		company.setName("丁");
//		reciritment.setCompany(company);
//		List<Reciritment> res = new ArrayList<Reciritment>();
//		res = dao.findJob(1, 5, reciritment);
	}
	//搜索招聘,按公司Id搜索
	public List<Reciritment> selectByUserId(Integer comId) {
		Set<Reciritment> set = new HashSet<Reciritment>();
		List<Reciritment> list = new ArrayList<Reciritment>();
		Company company = (Company) super.get(Company.class, comId);
		set =  company.getReciritments();
		for (Reciritment reciritment : set) {
			list.add(reciritment);
		}
		return list;
	}
	
}
