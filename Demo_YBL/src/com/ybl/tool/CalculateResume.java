package com.ybl.tool;

import com.ybl.model.Education;
import com.ybl.model.Employee;
import com.ybl.model.Resume;

public class CalculateResume {

	public int calculateResume(Resume resume){
		int score=0;
		int c=0,cc=0;
		Employee emp = resume.getEmployee();
		if(emp!=null){
			if(emp.getBirthday()==null)c++;
			cc++;
			if(emp.getCity()==null)c++;
			cc++;
			if(emp.getDegree()==null)c++;
			cc++;
			if(emp.getExpCity()==null)c++;
			cc++;
			if(emp.getExperience()==null)c++;
			cc++;
			if(emp.getExpJob()==null)c++;
			cc++;
			if(emp.getExpSalary()==null)c++;
			cc++;
			if(emp.getImage()==null)c++;
			cc++;
			if(emp.getLocation()==null)c++;
			cc++;
			if(emp.getName()==null)c++;
			cc++;
			if(emp.getSex()==null)c++;
			cc++;
			if(emp.getTel()==null)c++;
			cc++;
			if(emp.getType()==null)c++;
			cc++;
			score+=20*(cc-c)/cc;
		}
		c=cc=0;
		if(resume.getCertificate()==null)c++;
		cc++;
		if(resume.getEvaluation()==null)c++;
		cc++;
		if(resume.getPaper()!=null)score+=10;
		if(resume.getProjectExperience()!=null)score+=10;
		if(resume.getRank()==null)c++;
		cc++;
		score+=20*(cc-c)/cc;
		c=cc=0;
		Education edu = resume.getEducation();
		if(edu!=null){
			if(edu.getDegree()==null)c++;
			cc++;
			if(edu.getEndTime()==null)c++;
			cc++;
			if(edu.getMajor()==null)c++;
			cc++;
			if(edu.getSchool()==null)c++;
			cc++;
			if(edu.getStartTime()==null)c++;
			cc++;
			score+=15*(cc-c)/cc;
		}
		if(resume.getExperiences()!=null){
			int size=resume.getExperiences().size();
			if(size==1)score+=15;
			if(size>=2)score+=25;
		}
		return score+5>100?100:score+5; //超过100的话置为100
	}
}
