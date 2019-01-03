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
	private Integer key;//��������  ��0-string 1-integer
	private String findString;//�����Ĺؼ���
	private String newPassword,oldPassword;//�¾�����
	private String newCategoryName;//����ְλ����---������
	private Position position;//����ְλ��Ϣ
	private School school;//����ѧУ��Ϣ
	
	private String tableName;//����
	private String attributeName;//������
	private String tableId;//ɾ��ʱ����ֵ
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
		//ɾ������ΪtableName�ı������ֵΪtableId������
		//dao.deleteAll(tableName,tableId);
		return "adminUpdate";
	}

	
	
	//����ɾ��
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
			//ɾ������ΪtableName�ı������ֵΪtableId������
			//dao.deleteAll(tableName,tableId);
			return "adminDelete";
		}
	
	//��������
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
			//��ѯtableName���attributeName����=findString������tableName����
			List<Object> list = new ArrayList<Object>();
			System.out.println("Key = " + key);
			if(key==0) {
				System.out.println(key + " String ");
				list = dao.findString(tableName,attributeName,findString);
				System.out.print("��������ʵ���ࣺ");
			}
			else if(key==1){
				System.out.println(key + " Int ");
				list = dao.findInteger(tableName,attributeName,Integer.valueOf(findString));
				System.out.print("ID����ʵ���ࣺ");
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
	
	
	//��¼
	public String adminLogin() throws Exception{
		AdminDao admDao = new AdminDao();
		//��¼�����ز�������
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
//	//��������
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
//				System.out.println("������ְ�ߣ� " +findString);
//				EmployeeDao empDao = new EmployeeDao();
//				//�û���ģ������
//				List<Employee>list = empDao.selectByName(findString);
//				request.put("list", con.getList(list, "employee"));
//				request.put("tableName", "employee");
//				break;
//			}
//			case 2:{
//				System.out.println("������˾�� " +findString);
//				CompanyDao dao = new CompanyDao();
//				//��˾ģ������
//				List<Company>list = dao.selectByName(findString);
//				
//				request.put("list", con.getList(list, "company"));
//				request.put("tableName", "company");
//				break;
//			}
//			case 3:{
//				System.out.println("���������� " +findString);
//				ResumeDao dao = new ResumeDao();
//				//��������,����ְ��Id��
//				List<Resume>list = new ArrayList<Resume>();
//				list.add(dao.selectByUserId(Integer.valueOf(findString)));
//				
//				request.put("list", con.getList(list, "resume"));
//				request.put("tableName", "resume");
//				break;
//			}
//			case 4:{
//				System.out.println("������Ƹ�� " +findString);
//				ReciritmentDao dao = new ReciritmentDao();
//				//������Ƹ,����˾Id����
//				List<Reciritment>list = dao.selectByUserId(Integer.valueOf(findString));
//				
//				request.put("list", con.getList(list, "reciritment"));
//				request.put("tableName", "reciritment");
//				break;
//			}
//			case 5:{
//				System.out.println("����ѧУ�� " +findString);
//				SchoolDao dao = new SchoolDao();
//				//ѧУ��ģ������
//				List<School>list = dao.selectByNameA(findString);
//				
//				request.put("list", con.getList(list, "school"));
//				request.put("tableName", "school");
//				break;
//			}
//			case 6:{
//				System.out.println("����ְλ��Ϣ�� " +findString);
//				PositionDao dao = new PositionDao();
//				//ְλ��ģ������ְλ��Ϣ
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
	//���ӹ���Ա
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
		//���ӹ���Ա
		admin = admDao.inser(admin);
		
		return "addAdmin";
	}
	//�޸�����
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
		//�޸�idΪadminId �Ĺ���Ա������ΪnewPassword
		admDao.updatePassword(adminId,newPassword);
		return "adminUpdatePassword";
	}
	//����ְλ����
	public String adminInsertCategory() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		CategoryDao catDao = new CategoryDao();
		Category cat = new Category();
		//ͨ����������ѯ����
		cat = catDao.selectByName(newCategoryName);
		if(cat==null){
			//����һ������
			catDao.inser(newCategoryName);
		}
		return "adminInsertCategory";
	}
	//����ְλ��Ϣ
	public String adminInsertPosition() throws Exception{
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=2){
			session.clear();
			return "notAdmin";
		}
		CategoryDao catDao = new CategoryDao();
		Category cat = new Category();
		//ͨ����������ѯ����
		cat = catDao.selectByName(position.getCategory().getName());
		if(cat==null){
			return ERROR;
		}
		position.setCategory(cat);
		PositionDao posDao = new PositionDao();
		//����һ��position��Ϣ
		posDao.inser(position);
		return "adminInsertPosition";
	}
	//����ѧУ��Ϣ
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
