package com.ybl.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Resume entity. @author MyEclipse Persistence Tools
 */

public class Resume implements java.io.Serializable {

	// Fields

	private Integer id;
	private Education education;
	private Employee employee;
	private Integer isRegulate;
	private Integer certificate;
	private Integer rank;
	private String evaluation;
	private String paper;
	private Integer isPub;
	private String projectExperience;
	private Set companyGetResumes = new HashSet();
	private Set experiences = new HashSet();

	// Constructors

	/** default constructor */
	public Resume() {
	}

	/** full constructor */
	public Resume(Education education, Employee employee, Integer isRegulate,
			Integer certificate, Integer rank, String evaluation, String paper,
			Integer isPub, String projectExperience, Set companyGetResumes,
			Set experiences) {
		this.education = education;
		this.employee = employee;
		this.isRegulate = isRegulate;
		this.certificate = certificate;
		this.rank = rank;
		this.evaluation = evaluation;
		this.paper = paper;
		this.isPub = isPub;
		this.projectExperience = projectExperience;
		this.companyGetResumes = companyGetResumes;
		this.experiences = experiences;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Education getEducation() {
		return this.education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Integer getIsRegulate() {
		return this.isRegulate;
	}

	public void setIsRegulate(Integer isRegulate) {
		this.isRegulate = isRegulate;
	}

	public Integer getCertificate() {
		return this.certificate;
	}

	public void setCertificate(Integer certificate) {
		this.certificate = certificate;
	}

	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getEvaluation() {
		return this.evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	public String getPaper() {
		return this.paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	public Integer getIsPub() {
		return this.isPub;
	}

	public void setIsPub(Integer isPub) {
		this.isPub = isPub;
	}

	public String getProjectExperience() {
		return this.projectExperience;
	}

	public void setProjectExperience(String projectExperience) {
		this.projectExperience = projectExperience;
	}

	public Set getCompanyGetResumes() {
		return this.companyGetResumes;
	}

	public void setCompanyGetResumes(Set companyGetResumes) {
		this.companyGetResumes = companyGetResumes;
	}

	public Set getExperiences() {
		return this.experiences;
	}

	public void setExperiences(Set experiences) {
		this.experiences = experiences;
	}

}