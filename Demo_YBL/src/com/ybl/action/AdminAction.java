package com.ybl.action;

import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.ybl.dao.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.AdminDao;
import com.ybl.dao.CategoryDao;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.EmployeeDao;
import com.ybl.dao.PositionDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.dao.ResumeDao;
import com.ybl.dao.SchoolDao;
import com.ybl.model.Admin;
import com.ybl.model.Category;
import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.model.Position;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;
import com.ybl.model.School;
import com.ybl.tool.Conversion;
import com.ybl.tool.YblHashCode;

public class AdminAction extends ActionSupport {

	private Admin admin;
	private Integer key;//搜索类型  ：0-string 1-integer
	private String findString;//搜索的关键词
	private String newPassword,oldPassword;//新旧密码
	private String newCategoryName;//增加职位分类---分类名
	private Position position;//增加职位信息
	private School school;//增加学校信息
	
	private String tableName;//表名
	private String attributeName;//属性名
	private String tableId;//删除时主键值
	public String adminUpdate(){
		System.out.println(tableName);
		System.out.println(Integer.valueOf(tableId));
		
		/*
		"tableName":tableName,
		"tableId":tableId,
		"attributeName":attributeName,
		"findString":findString
		"key":key
		*/
		
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		tableName = tableName.trim();
		if(key==0) new DatabaseOperation().update(tableName,1,attributeName,findString,"id",Integer.valueOf(tableId));
		else new DatabaseOperation().update(tableName,1,attributeName,Integer.valueOf(findString),"id",Integer.valueOf(tableId));
		//删除表名为tableName的表的主键值为tableId的数据
		//dao.deleteAll(tableName,tableId);
		return "adminUpdate";
	}

	
	
	//所有删除
		public String adminDelete(){
			System.out.println(tableName);
			System.out.println(Integer.valueOf(tableId));
			Map session = ActionContext.getContext().getSession();
			Integer userIdentity=(Integer)session.get("userIdentity");
			if(userIdentity!=2){
				session.clear();
				return "notAdmin";
			}
			tableName = tableName.trim();
			new DatabaseOperation().delete(tableName,"id",Integer.valueOf(tableId));
			//删除表名为tableName的表的主键值为tableId的数据
			//dao.deleteAll(tableName,tableId);
			return "adminDelete";
		}
	
	//所有搜索
		public String admin_find(){
			Map session = ActionContext.getContext().getSession();
			Integer userIdentity=(Integer)session.get("userIdentity");
			if(userIdentity==null||userIdentity!=2){
				session.clear();
				return "notAdmin";
			}
			Conversion con = new Conversion();
			Map request=(Map)ActionContext.getContext().get("request");
			AdminDao dao = new AdminDao();
			//查询tableName表的attributeName属性=findString的所有tableName对象
			List<Object> list = new ArrayList<Object>();
			System.out.println("Key = " + key);
			if(key==0) {
				System.out.println(key + " String ");
				list = dao.findString(tableName,attributeName,findString);
				System.out.print("名字所属实例类：");
			}
			else if(key==1){
				System.out.println(key + " Int ");
				list = dao.findInteger(tableName,attributeName,Integer.valueOf(findString));
				System.out.print("ID所属实例类：");
			}else if(key==2){
				ArrayList<Object[]> arr=new DatabaseOperation().select(tableName,0,attributeName,findString);
				if(arr.size()==0) list=new ArrayList<Object>();
				
				else list = dao.findString(tableName,"id",String.valueOf(arr.get(0)[0]));
			}
			else if(key==3){
				ArrayList<Object[]> arr=new DatabaseOperation().select(tableName,0,attributeName,Integer.valueOf(findString));
				if(arr.size()==0) list=new ArrayList<Object>();
				else list = dao.findInteger(tableName,"id",Integer.valueOf(String.valueOf(arr.get(0)[0])));
				
			}
			ArrayList<Object[]> cc=con.getList(list,tableName);
			request.put("list",cc);
			for(int i=0;i<cc.size();i++){
				Object[] object=cc.get(i);
				for(int j=0;j<object.length;j++){
					System.out.print(String.valueOf(object[j])+" ");
				}
				System.out.println();
			}
			request.put("tableName",tableName);
			return "admin_find";
		}
	
	
	//登录
	public String adminLogin() throws Exception{
		AdminDao admDao = new AdminDao();
		//登录，返回布尔类型
		System.out.println(admin.getId());
		System.out.println(admin.getPassword());
		if(!admDao.login(admin)){
			return ERROR;
		}
		YblHashCode yblhash = new YblHashCode();
		admin.setPassword(yblhash.encrypt(admin.getPassword()));
		Map session = ActionContext.getContext().getSession();
		session.put("adminId", admin.getId());
		session.put("userIdentity", (Integer)2);
		return "adminLogin";
	}
//	//各种搜索
//	public String adminFind() throws Exception{
//		Map session = ActionContext.getContext().getSession();
//		Integer userIdentity=(Integer)session.get("userIdentity");
//		if(userIdentity!=2){
//			session.clear();
//			return "notAdmin";
//		}
//		Conversion con = new Conversion();
//		Map request=(Map)ActionContext.getContext().get("request");
//		switch(key){
//			case 1:{
//				System.out.println("搜索求职者： " +findString);
//				EmployeeDao empDao = new EmployeeDao();
//				//用户名模糊搜索
//				List<Employee>list = empDao.selectByName(findString);
//				request.put("list", con.getList(list, "employee"));
//				request.put("tableName", "employee");
//				break;
//			}
//			case 2:{
//				System.out.println("搜索公司： " +findString);
//				CompanyDao dao = new CompanyDao();
//				//公司模糊搜索
//				List<Company>list = dao.selectByName(findString);
//				
//				request.put("list", con.getList(list, "company"));
//				request.put("tableName", "company");
//				break;
//			}
//			case 3:{
//				System.out.println("搜索简历： " +findString);
//				ResumeDao dao = new ResumeDao();
//				//搜索简历,按求职者Id搜
//				List<Resume>list = new ArrayList<Resume>();
//				list.add(dao.selectByUserId(Integer.valueOf(findString)));
//				
//				request.put("list", con.getList(list, "resume"));
//				request.put("tableName", "resume");
//				break;
//			}
//			case 4:{
//				System.out.println("搜索招聘： " +findString);
//				ReciritmentDao dao = new ReciritmentDao();
//				//搜索招聘,按公司Id搜索
//				List<Reciritment>list = dao.selectByUserId(Integer.valueOf(findString));
//				
//				request.put("list", con.getList(list, "reciritment"));
//				request.put("tableName", "reciritment");
//				break;
//			}
//			case 5:{
//				System.out.println("搜索学校： " +findString);
//				SchoolDao dao = new SchoolDao();
//				//学校名模糊搜索
//				List<School>list = dao.selectByNameA(findString);
//				
//				request.put("list", con.getList(list, "school"));
//				request.put("tableName", "school");
//				break;
//			}
//			case 6:{
//				System.out.println("搜索职位信息： " +findString);
//				PositionDao dao = new PositionDao();
//				//职位名模糊搜索职位信息
//				List<Position>list = dao.selectByName(findString);
//				
//				request.put("list", con.getList(list, "position"));
//				request.put("tableName", "position");
//				break;
//			}
//		}
//		
//		return "adminFind";
//	}
	//增加管理员
	public String addAdmin() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		Integer adminId=(Integer)session.get("adminId");
		if(adminId!=1){
			session.clear();
			return "notSuperAdmin";
		}
		AdminDao admDao = new AdminDao();
		admin.setPassword(admin.getPassword().trim());
		if(admin.getPassword()==null)admin.setPassword("123456");
		YblHashCode yblhash = new YblHashCode();
		admin.setPassword(yblhash.encrypt(admin.getPassword()));
		//增加管理员
		admin = admDao.inser(admin);
		
		return "addAdmin";
	}
	//修改密码
	public String adminUpdatePassword() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		YblHashCode yblhash = new YblHashCode();
		oldPassword = yblhash.encrypt(oldPassword);
		newPassword = yblhash.encrypt(newPassword);
		Integer adminId=(Integer)session.get("adminId");
		admin.setId(adminId);
		admin.setPassword(oldPassword);
		AdminDao admDao = new AdminDao();
		if(!admDao.login(admin)){
			return ERROR;
		}
		//修改id为adminId 的管理员的密码为newPassword
		admDao.updatePassword(adminId,newPassword);
		return "adminUpdatePassword";
	}
	//增加职位分类
	public String adminInsertCategory() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		CategoryDao catDao = new CategoryDao();
		Category cat = new Category();
		//通过分类名查询分类
		cat = catDao.selectByName(newCategoryName);
		if(cat==null){
			//新增一个分类
			catDao.inser(newCategoryName);
		}
		return "adminInsertCategory";
	}
	//增加职位信息
	public String adminInsertPosition() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		CategoryDao catDao = new CategoryDao();
		Category cat = new Category();
		//通过分类名查询分类
		cat = catDao.selectByName(position.getCategory().getName());
		if(cat==null){
			return ERROR;
		}
		position.setCategory(cat);
		PositionDao posDao = new PositionDao();
		//插入一条position信息
		posDao.inser(position);
		return "adminInsertPosition";
	}
	//增加学校信息
	public String adminInsertSchool() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		SchoolDao schDao = new SchoolDao();
		schDao.inser(school);
		return "adminInsertSchool";
	}
	/*
	public String delete(){
		
		
		
		
	}
	*/

	public Admin getAdmin() {
		return admin;
	}


	public void setAdmin(Admin admin) {
		this.admin = admin;
	}


	public int getKey() {
		return key;
	}


	public void setKey(int key) {
		this.key = key;
	}


	public String getFindString() {
		return findString;
	}


	public void setFindString(String findString) {
		this.findString = findString;
	}


	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}


	public String getOldPassword() {
		return oldPassword;
	}


	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}


	public String getNewCategoryName() {
		return newCategoryName;
	}


	public void setNewCategoryName(String newCategoryName) {
		this.newCategoryName = newCategoryName;
	}


	public Position getPosition() {
		return position;
	}


	public void setPosition(Position position) {
		this.position = position;
	}


	public School getSchool() {
		return school;
	}


	public void setSchool(School school) {
		this.school = school;
	}


	public String getTableName() {
		return tableName;
	}


	public void setTableName(String tableName) {
		this.tableName = tableName;
	}


	public String getAttributeName() {
		return attributeName;
	}


	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public void setKey(Integer key) {
		this.key = key;
	}
	
}
