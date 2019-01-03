package com.ybl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Reciritment entity. @author MyEclipse Persistence Tools
 */

public class Reciritment implements java.io.Serializable {

	private Integer id;
	private Position position;
	private Company company;
	private Integer num;
	private Integer jobType;
	private Integer minSalary;
	private Integer maxSalary;
	private String city;
	private String location;
	private Integer jobExperience;
	private Integer degree;
	private String description;
	private String tag;
	private Date sendDate;
	private Integer isOk;
	private Set companyGetResumes = new HashSet(0);

	// Constructors

	/** default constructor */
	public Reciritment() {
	}

	/** full constructor */
	public Reciritment(Position position, Company company, Integer num,
			Integer jobType, Integer minSalary, Integer maxSalary, String city,
			String location, Integer jobExperience, Integer degree,
			String description, String tag, Date sendDate, Integer isOk,
			Set companyGetResumes) {
		this.position = position;
		this.company = company;
		this.num = num;
		this.jobType = jobType;
		this.minSalary = minSalary;
		this.maxSalary = maxSalary;
		this.city = city;
		this.location = location;
		this.jobExperience = jobExperience;
		this.degree = degree;
		this.description = description;
		this.tag = tag;
		this.sendDate = sendDate;
		this.isOk = isOk;
		this.companyGetResumes = companyGetResumes;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Position getPosition() {
		return this.position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getJobType() {
		return this.jobType;
	}

	public void setJobType(Integer jobType) {
		this.jobType = jobType;
	}

	public Integer getMinSalary() {
		return this.minSalary;
	}

	public void setMinSalary(Integer minSalary) {
		this.minSalary = minSalary;
	}

	public Integer getMaxSalary() {
		return this.maxSalary;
	}

	public void setMaxSalary(Integer maxSalary) {
		this.maxSalary = maxSalary;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getJobExperience() {
		return this.jobExperience;
	}

	public void setJobExperience(Integer jobExperience) {
		this.jobExperience = jobExperience;
	}

	public Integer getDegree() {
		return this.degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTag() {
		return this.tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Date getSendDate() {
		return this.sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public Integer getIsOk() {
		return this.isOk;
	}

	public void setIsOk(Integer isOk) {
		this.isOk = isOk;
	}

	public Set getCompanyGetResumes() {
		return this.companyGetResumes;
	}

	public void setCompanyGetResumes(Set companyGetResumes) {
		this.companyGetResumes = companyGetResumes;
	}

}