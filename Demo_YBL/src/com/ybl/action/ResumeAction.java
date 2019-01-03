package com.ybl.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.CompanyGetResumeDao;
import com.ybl.dao.EducationDao;
import com.ybl.dao.EmployeeDao;
import com.ybl.dao.ExperienceDao;
import com.ybl.dao.FavorsDao;
import com.ybl.dao.ResumeDao;
import com.ybl.dao.SchoolDao;
import com.ybl.model.Company;
import com.ybl.model.Education;
import com.ybl.model.Employee;
import com.ybl.model.Experience;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;
import com.ybl.model.School;
import com.ybl.tool.CalculateResume;
import com.ybl.tool.ObjectFieldValue;

public class ResumeAction extends ActionSupport {
	private Integer status;
	private Resume myResume;//���������������ڽ������������˻�����Ϣ�����������1��1����Ϣ��������
	private Experience experience;//��������
	
	//Ͷ�ݵ�ĳ״̬�ļ�����ѯ
		public String selectStatus(){
			System.out.println("�������״̬��ѯAction..............");
			Map session = ActionContext.getContext().getSession();
			Integer userIdentity=(Integer)session.get("userIdentity");
			Map request=(Map)ActionContext.getContext().get("request");
			if(userIdentity==null||userIdentity!=0){
				return ERROR;
			}
			Integer resId=(Integer)session.get("myResumeId");
			CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
			//���ݼ���״̬�ͼ���id����ѯ
			List<Reciritment> recList = cgrDao.selectByStatusResId(status,resId);
			System.out.println("recList��Size��" + recList.size());
			request.put("recList", recList);
			
			return "selectStatus";
		}

	
	//���ҵļ����������ҳ��
	public String myResume(){
		Map session = ActionContext.getContext().getSession();
		Integer resId=(Integer)session.get("myResumeId");
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		ResumeDao reDao = new ResumeDao();
		Resume resume = reDao.selectById(resId);
		CalculateResume cal = new CalculateResume();
		int score = cal.calculateResume(resume);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("myResume", resume);
		request.put("score", score);
		return "myResume";
	}
	
	//�޸Ļ�����Ϣ
	//���� �Ա�  ��ְ��ѧ��degree  ��ְ�߹�������experience  ��ְ���ֻ���tel
	public String updateBasic(){
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		EmployeeDao empDao = new EmployeeDao();
		Employee emp = empDao.selectById(userId);
		emp.setName(myResume.getEmployee().getName());
		emp.setSex(myResume.getEmployee().getSex());
		emp.setDegree(myResume.getEmployee().getDegree());
		emp.setExperience(myResume.getEmployee().getExperience());
		emp.setTel(myResume.getEmployee().getTel());
		//�޸�Employee��
		empDao.updateEmp(emp);
		return "updateBasic";
	}
	//�޸Ĺ�������
	public String updateExpectation(){
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		EmployeeDao empDao = new EmployeeDao();
		Employee emp = empDao.selectById(userId);
		emp.setExpCity(myResume.getEmployee().getExpCity());
		emp.setExpJob(myResume.getEmployee().getExpJob());
		emp.setExpSalary(myResume.getEmployee().getExpSalary());
		emp.setType(myResume.getEmployee().getType());
		//�޸�Employee��
		empDao.updateEmp(emp);
		return "updateExpectation";
	}
	
	//���ӹ�������
	//��ְ��ʼʱ��startTime  ��ְ����ʱ��endTime   ��˾����companyName  ����ְλduty
	//1��n
	public String insertExperience(){
		System.out.println("���ӹ�������");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity = (Integer)session.get("userIdentity");
		System.out.println("userIdentity: " + userIdentity);//
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId = (Integer)session.get("userId");
		Integer resId = (Integer)session.get("myResumeId");
		System.out.println("userId = " + userId + " resId = " + resId);//
		ResumeDao reDao = new ResumeDao();
		Resume resume = reDao.selectById(resId);
		System.out.println("experience 111= " + experience.getCompanyName() + " " + experience.getDuty() + " " + experience.getStartTime() + " " +experience.getEndTime()); //xxxxxxxx
		experience.setResume(resume);
		System.out.println("experience 22222= " + experience.getCompanyName() + " " + experience.getDuty() + " " + experience.getStartTime() + " " +experience.getEndTime());
		ExperienceDao expDao = new ExperienceDao();
		expDao.inser(experience);
		System.out.println("���빤������ɹ���");
		return "updateExperience";
	}
	
	//�޸���Ŀ����
	public String updateProjectExperience(){
		System.out.println("updateProjectExperience");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		ResumeDao reDao = new ResumeDao();
		//�޸���ְ��IdΪuserId�ļ�����Ŀ����ΪmyResume.getProjectExperience()
		reDao.upDateProExpByEmpId(userId, myResume.getProjectExperience());
		return "updateProjectExperience";
	}
	
	//�޸Ľ�������
	public String updateEducation(){
		System.out.println("updateEducation��������");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		SchoolDao sDao = new SchoolDao();
		School sch = sDao.selectByName(myResume.getEducation().getSchool().getName());
		System.out.println("���Խ�������444��" + myResume.getEducation().getSchool().getName()+"    "+sch.getName() + " " + sch.getCity());
		if(sch==null){
			return "schoolNull";
		}
		System.out.println("myResume.getEducation().setSchool(sch); ǰ");
		myResume.getEducation().setSchool(sch);
		System.out.println("myResume.getEducation().setSchool(sch); ��" + myResume.getEducation().getSchool().getCity());
		ResumeDao reDao = new ResumeDao();
		//�鿴���û��Ƿ���д���������������ޣ���insert����update
		
		if(reDao.selectById(resId).getEducation()==null){
			EducationDao eduDao = new EducationDao();
			//��Education����һ�����ݣ����޸�resume��eduid
			reDao.inserEducation(resId, eduDao.inser(myResume.getEducation()));
			
		}else{
			//�޸ļ���idΪresId�� ��������ΪmyResume.getEducation()
			System.out.println("DAO����ǰ.....��������....." + resId+"  " + myResume.getEducation().getMajor());
			reDao.upDateEducationById(resId,myResume.getEducation()); //xxxxxxxxxxxxxx
			System.out.println("���������޸ĺ� ��" + myResume.getEducation().getSchool().getName() + " " + myResume.getEducation().getMajor());
			System.out.println("DAO������.....��������....." + resId+"  " + myResume.getEducation().getMajor());
		}
		return "updateEducation";
	}
	//�޸���������
	public String updateEvaluation(){
		System.out.println("updateEvaluation!");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		ResumeDao reDao = new ResumeDao();
		//�޸ļ���idΪresId�� ��������ΪmyResume.getEvaluation()
		reDao.upDateEvaluationById(resId,myResume.getEvaluation());
		System.out.println("����������" + myResume.getEvaluation());
		return "updateEvaluation";
	}
	//�޸����ģ���Ʒչʾ��
	public String updatePaper(){
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId = (Integer)session.get("myResumeId");
		ResumeDao reDao = new ResumeDao();
		//�޸ļ���idΪresId�� ����ΪmyResume.getPaper()
		reDao.upDatePaperById(resId,myResume.getPaper());
		return "updatePaper";
	}
	
	//Ԥ��
	public String detailsResume(){
		System.out.println("detailsResume");
		Map request=(Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer resId=(Integer)session.get("myResumeId");
		ResumeDao resDao = new ResumeDao();
		//��ѯResume��idΪresId��Resume
		Resume res = resDao.selectById(resId);
		request.put("detailsResume", res);
		return "detailsResume";
	}
	public Resume getMyResume() {
		return myResume;
	}
	public void setMyResume(Resume myResume) {
		this.myResume = myResume;
	}
	public Experience getExperience() {
		return experience;
	}
	public void setExperience(Experience experience) {
		this.experience = experience;
	}


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
	/*
	//ʩ���С�������
	private Employee userInfo;
	private Resume resume;
	private Education education;
	private String school;
	private Experience addExp;
	private List<Experience> exp = new ArrayList<Experience>();
	
	//
	public String addExperience(){
		
		
		
		return "success";
	}
	
	public String updateResume(){
		Map session = ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("userId");
		//resume.setEpId(userId);
		
		
		
		/*
		EmployeeDao emDao = new EmployeeDao();
		Employee tem = emDao.selectById(userId);
		if(userInfo.getBirthday()!=null)tem.setBirthday(userInfo.getBirthday());
		if(userInfo.getCity()!=null)tem.setCity(userInfo.getCity());
		if(userInfo.getDegree()!=null)tem.setDegree(userInfo.getDegree());
		if(userInfo.getEmail()!=null)tem.setEmail(userInfo.getEmail());
		if(userInfo.getExpCity()!=null)tem.setExpCity(userInfo.getExpCity());
		if(userInfo.getExperience()!=null)tem.setExperience(userInfo.getExperience());
		if(userInfo.getExpJob()!=null)tem.setExpJob(userInfo.getExpJob());
		if(userInfo.getExpSalary()!=null)tem.setExpSalary(userInfo.getExpSalary());
		if(userInfo.getImage()!=null)tem.setImage(userInfo.getImage());
		if(userInfo.getLocation()!=null)tem.setLocation(userInfo.getLocation());
		if(userInfo.getName()!=null)tem.setName(userInfo.getName());
		if(userInfo.getSex()!=null)tem.setSex(userInfo.getSex());
		if(userInfo.getTel()!=null)tem.setTel(userInfo.getTel());
		if(userInfo.getType()!=null)tem.setType(userInfo.getType());
		*/
		
		/*
		
		return SUCCESS;
	}
	*/
	
}
