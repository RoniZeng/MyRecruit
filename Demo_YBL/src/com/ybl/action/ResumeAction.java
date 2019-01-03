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
	private Resume myResume;//简历，其他类似于教育经历、个人基本信息这种与简历表1对1的信息都放在这
	private Experience experience;//工作经历
	
	//投递的某状态的简历查询
		public String selectStatus(){
			System.out.println("进入简历状态查询Action..............");
			Map session = ActionContext.getContext().getSession();
			Integer userIdentity=(Integer)session.get("userIdentity");
			Map request=(Map)ActionContext.getContext().get("request");
			if(userIdentity==null||userIdentity!=0){
				return ERROR;
			}
			Integer resId=(Integer)session.get("myResumeId");
			CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
			//根据简历状态和简历id来查询
			List<Reciritment> recList = cgrDao.selectByStatusResId(status,resId);
			System.out.println("recList的Size：" + recList.size());
			request.put("recList", recList);
			
			return "selectStatus";
		}

	
	//按我的简历，进入该页面
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
	
	//修改基本信息
	//姓名 性别  求职者学历degree  求职者工作经验experience  求职者手机号tel
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
		//修改Employee表
		empDao.updateEmp(emp);
		return "updateBasic";
	}
	//修改工作期望
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
		//修改Employee表
		empDao.updateEmp(emp);
		return "updateExpectation";
	}
	
	//增加工作经历
	//在职开始时间startTime  在职结束时间endTime   公司名称companyName  具体职位duty
	//1对n
	public String insertExperience(){
		System.out.println("增加工作经历");
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
		System.out.println("插入工作经验成功！");
		return "updateExperience";
	}
	
	//修改项目经验
	public String updateProjectExperience(){
		System.out.println("updateProjectExperience");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		ResumeDao reDao = new ResumeDao();
		//修改求职者Id为userId的简历项目经验为myResume.getProjectExperience()
		reDao.upDateProExpByEmpId(userId, myResume.getProjectExperience());
		return "updateProjectExperience";
	}
	
	//修改教育经历
	public String updateEducation(){
		System.out.println("updateEducation教育经验");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		SchoolDao sDao = new SchoolDao();
		School sch = sDao.selectByName(myResume.getEducation().getSchool().getName());
		System.out.println("测试教育经历444：" + myResume.getEducation().getSchool().getName()+"    "+sch.getName() + " " + sch.getCity());
		if(sch==null){
			return "schoolNull";
		}
		System.out.println("myResume.getEducation().setSchool(sch); 前");
		myResume.getEducation().setSchool(sch);
		System.out.println("myResume.getEducation().setSchool(sch); 后" + myResume.getEducation().getSchool().getCity());
		ResumeDao reDao = new ResumeDao();
		//查看该用户是否填写过教育经历，若无，则insert否则update
		
		if(reDao.selectById(resId).getEducation()==null){
			EducationDao eduDao = new EducationDao();
			//向Education插入一条数据，并修改resume的eduid
			reDao.inserEducation(resId, eduDao.inser(myResume.getEducation()));
			
		}else{
			//修改简历id为resId的 教育经历为myResume.getEducation()
			System.out.println("DAO方法前.....两个参数....." + resId+"  " + myResume.getEducation().getMajor());
			reDao.upDateEducationById(resId,myResume.getEducation()); //xxxxxxxxxxxxxx
			System.out.println("教育经历修改后 ：" + myResume.getEducation().getSchool().getName() + " " + myResume.getEducation().getMajor());
			System.out.println("DAO方法后.....两个参数....." + resId+"  " + myResume.getEducation().getMajor());
		}
		return "updateEducation";
	}
	//修改自我描述
	public String updateEvaluation(){
		System.out.println("updateEvaluation!");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		ResumeDao reDao = new ResumeDao();
		//修改简历id为resId的 自我描述为myResume.getEvaluation()
		reDao.upDateEvaluationById(resId,myResume.getEvaluation());
		System.out.println("自我描述：" + myResume.getEvaluation());
		return "updateEvaluation";
	}
	//修改论文（作品展示）
	public String updatePaper(){
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer resId = (Integer)session.get("myResumeId");
		ResumeDao reDao = new ResumeDao();
		//修改简历id为resId的 论文为myResume.getPaper()
		reDao.upDatePaperById(resId,myResume.getPaper());
		return "updatePaper";
	}
	
	//预览
	public String detailsResume(){
		System.out.println("detailsResume");
		Map request=(Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer resId=(Integer)session.get("myResumeId");
		ResumeDao resDao = new ResumeDao();
		//查询Resume的id为resId的Resume
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
	//施工中。。。。
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
