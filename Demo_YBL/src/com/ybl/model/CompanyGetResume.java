package com.ybl.model;

/**
 * CompanyGetResume entity. @author MyEclipse Persistence Tools
 */

public class CompanyGetResume implements java.io.Serializable {

	private CompanyGetResumeId id;
	private Integer status;

	/** default constructor */
	public CompanyGetResume() {
	}

	/** minimal constructor */
	public CompanyGetResume(CompanyGetResumeId id) {
		this.id = id;
	}

	/** full constructor */
	public CompanyGetResume(CompanyGetResumeId id, Integer status) {
		this.id = id;
		this.status = status;
	}

	// Property accessors

	public CompanyGetResumeId getId() {
		return this.id;
	}

	public void setId(CompanyGetResumeId id) {
		this.id = id;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CompanyGetResume [id=" + id + ", status=" + status + "]";
	}
	
}