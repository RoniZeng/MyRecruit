package com.ybl.model;

import java.util.Date;

/**
 * Experience entity. @author MyEclipse Persistence Tools
 */

public class Experience implements java.io.Serializable {

	// Fields

	private Integer id;
	private Resume resume; //Ò»¶Ô¶à
	private String companyName;
	private String department;
	private String duty;
	private Date startTime;
	private Date endTime;
	private String description;

	// Constructors

	/** default constructor */
	public Experience() {
	}

	/** minimal constructor */
	public Experience(Resume resume) {
		this.resume = resume;
	}

	/** full constructor */
	public Experience(Resume resume, String companyName, String department,
			String duty, Date startTime, Date endTime, String description) {
		this.resume = resume;
		this.companyName = companyName;
		this.department = department;
		this.duty = duty;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Resume getResume() {
		return this.resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}