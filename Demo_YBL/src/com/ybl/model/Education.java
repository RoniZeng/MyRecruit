package com.ybl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Education entity. @author MyEclipse Persistence Tools
 */

public class Education implements java.io.Serializable {

	// Fields
	private Integer id;
	private School school;
	private Integer degree;
	private String major;
	private Date startTime;
	private Date endTime;
//	private Set resumes = new HashSet(0);
	private Resume resumes;
	// Constructors

	/** default constructor */
	public Education() {
	}

	/** full constructor */
	public Education(School school, Integer degree, String major,
			Date startTime, Date endTime, Resume resumes) {
		this.school = school;
		this.degree = degree;
		this.major = major;
		this.startTime = startTime;
		this.endTime = endTime;
		this.resumes = resumes;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public School getSchool() {
		return this.school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Integer getDegree() {
		return this.degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}

	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
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

	public Resume getResumes() {
		return resumes;
	}

	public void setResumes(Resume resumes) {
		this.resumes = resumes;
	}

	

}