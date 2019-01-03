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
		System.out.println("����DAO������ְλ��Ϣ������rec��������������");
		super.add(reciritment);
	}
	
	public void deleteRec(Integer id){
		Reciritment reciritment = (Reciritment) super.get(Reciritment.class, id);
		super.delete(reciritment);
	}
	
	public Reciritment selectById(Integer id) {
		return (Reciritment) super.get(Reciritment.class, id);
	}
	
	
	//��ѯ��˾IDΪcomId ������ �Ƿ���Ч״̬ ΪisOk������ ��Ƹ��Ϣ
	public List<Reciritment> selectByComIdIsOK(Integer comId, Integer isOk) {
		List<Reciritment> list = new ArrayList<Reciritment>(); //�ù�˾��������Ƹ��Ϣ����
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
				System.out.println("û�ҵ���¼��");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
	//��ѯ��˾comId���µ�i����Ƹ��Ϣ SendDate
	public List<Reciritment> uSendDateSelectById(Integer userId, int cnt) {
		List<Reciritment> list = new ArrayList<Reciritment>(); //�ù�˾��������Ƹ��Ϣ����
		Session session = HibernateSessionFactory.getSession();
		try {
			Company company = (Company) session.get(Company.class, userId); //��ȡ���ΪcomId�Ĺ�˾
			String hql="from Reciritment r order by r.sendDate desc";
			Query query = session .createQuery(hql);
			//xxxxxxxxxxxxxxxxxxxx
			if(cnt>=3) { //����������ʾ����
				query.setFirstResult(0);//�ӵ�һ����¼��ʼ
				query.setMaxResults(3);// ǰcnt������ 0 1 2
			}else {   //û������������ʾ���е�
				query.setFirstResult(0);//�ӵ�һ����¼��ʼ
				query.setMaxResults(cnt);// ǰcnt������ 0 1
			}
			
			list = query.list();
			for (Reciritment reciritment : list) {
				System.out.println("����ְλ��˾�����䣺 " + reciritment.getCompany().getEmail() + "  ְλ����" + reciritment.getNum() + "  ְλ����" + reciritment.getPosition().getName());
			}
			System.out.println("��ѯ�ɹ���");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	//����ְλ��š�isOk״̬
	//�ѱ��Ϊid����Ƹ��Ϣ��isOk��Ϊ0 updateIsOKById
	public void updateIsOKById(Integer id, Integer isOk) {
		Reciritment reciritment = (Reciritment) super.get(Reciritment.class, id); //��ȡ��Ƹ��Ϣ����
		reciritment.setIsOk(isOk); 
		super.update(reciritment);
	}
	
	/*
	 * ��ѯ��������  ְλ������˾��						ģ������
	 * 			     ���С��������顢���ѧ������������           ȷ�еĵ���ĳ��ֵ
	 * 			     ��н��Χ�����������н��Χ��[L,R], ĳ��Ƹ����н��ΧΪ[l,r],����  L<=l<r<=R ����������
	 * 			     ����ʱ�䣺���㵱ǰʱ������Ƹ����ʱ��Ĳ�D��D<=day  ����������
	 * ��������,��Ϊ�մ����������������
	 * Ҫ����ҳ
	 */
	//�õ��ı�ְλ����˾
	public List<Reciritment> findJob(int pageNow, int pagesize,
			Reciritment reciritment) {
		Session session = HibernateSessionFactory.getSession();
		List<Company> clist = new ArrayList<Company>(); //����������ְλ
		List<Reciritment> rlist = new ArrayList<Reciritment>(); //����������ְλ
		System.out.println("�����ѯ����...");
		String rname = null;
		String cname = null ;
		if(reciritment==null)
			System.out.println("ְλ��Ϣ����Ϊ��!");
		if(reciritment.getPosition()!=null){
			rname = reciritment.getPosition().getName(); //searchName ģ������ְλ��
			System.out.println("ְλ���ƣ�" + rname);
		}
		if(reciritment.getCompany()!=null){
			cname = reciritment.getCompany().getName(); //searchName ģ��������˾��
			System.out.println("��˾���ƣ�" + cname);
		}
		System.out.println("ְλ���ƣ�" + rname + " ��˾���ƣ�" + cname);
		if(rname != null) {
			String hql = "from Reciritment where name like '%"+rname+"%'"; //ģ����ѯְλ����
			Query query = session.createQuery(hql);
			query.setFirstResult(pagesize*(pageNow-1));
			query.setMaxResults(pagesize);
			rlist = query.list();
		} else {
			String hql = "from Company where name like '%"+cname+"%'"; //ģ����ѯ��˾����
			Query query = session.createQuery(hql);
			System.out.println("11111111111111111111111");
			clist = query.list();
			System.out.println("��ѯ��˾���ƣ�");
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
							System.out.println("��˾����" + j +" "+ company.getName()+" ְλ����" +rec.getPosition().getName()+" "+rec.getId());
						}
						if(i>st+pagesize)break;
					}
					if(i>st+pagesize)break;
				}
			}
			else{
				System.out.println("����Ƹ��Ϣ��");
			}
		}
		session.close();
		
		return rlist;
	}

	public int findJobSize(Reciritment reciritment) { 
		Session session = HibernateSessionFactory.getSession();
		List<Reciritment> rlist = new ArrayList<Reciritment>(); //����������ְλ
		String rname = null;
		String cname = null ;
		if(reciritment==null)
			System.out.println("ְλ��Ϣ����Ϊ��........");
		if(reciritment.getPosition()!=null){
			rname = reciritment.getPosition().getName(); //searchName ģ������ְλ��
			System.out.println("ְλ���ƣ�" + rname);
		}
		if(reciritment.getCompany()!=null){
			cname = reciritment.getCompany().getName(); //searchName ģ��������˾��
			System.out.println("��˾���ƣ�" + cname);
		}
		System.out.println("ְλ���ƣ�" + rname+"��˾���ƣ�" + cname);
		if(rname != null) {
			String hql = "from Reciritment where name like '%"+rname+"%'"; //ģ����ѯְλ����
			Query query = session.createQuery(hql);
			rlist = query.list();

		} else {
			String hql = "from Company where name like '%"+cname+"%'"; //ģ����ѯ��˾����
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
//		company.setName("��");
//		reciritment.setCompany(company);
//		List<Reciritment> res = new ArrayList<Reciritment>();
//		res = dao.findJob(1, 5, reciritment);
	}
	//������Ƹ,����˾Id����
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
