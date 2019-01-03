package com.ybl.model;

import java.util.Date;

public class ReciritmentSearch {
	private Integer id;				//职位发布id
	private String caName;			//职位名称
	private String comName;			//公司名称
	private Integer num;			//招聘人数
	private Integer jobType;		//工作性质
	private Integer minSalary;		//最低月薪
	private Integer maxSalary;		//最高月薪
	private String city;			//所在城市
	private String location;		//工作地址
	private Integer jobExperience;  //工作经验
	private Integer degree;			//学历要求
	private String description;		//职位描述
	private String tag;				//职位标签
	private Date sendDate;			//发布日期
	private Integer isOk;			//是否有效
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getCaName() {
		return caName;
	}
	public void setCaName(String caName) {
		this.caName = caName;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getJobType() {
		return jobType;
	}
	public void setJobType(Integer jobType) {
		this.jobType = jobType;
	}
	public Integer getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(Integer minSalary) {
		this.minSalary = minSalary;
	}
	public Integer getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(Integer maxSalary) {
		this.maxSalary = maxSalary;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Integer getJobExperience() {
		return jobExperience;
	}
	public void setJobExperience(Integer jobExperience) {
		this.jobExperience = jobExperience;
	}
	public Integer getDegree() {
		return degree;
	}
	public void setDegree(Integer degree) {
		this.degree = degree;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Integer getIsOk() {
		return isOk;
	}
	public void setIsOk(Integer isOk) {
		this.isOk = isOk;
	}
	
	

}
