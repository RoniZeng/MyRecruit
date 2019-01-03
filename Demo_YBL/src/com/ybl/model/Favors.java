package com.ybl.model;

import java.util.Date;

/**
 * Favors entity. @author MyEclipse Persistence Tools
 */

public class Favors implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer collectId;
	private Date collectTime;

	// Constructors

	/** default constructor */
	public Favors() {
	}

	/** full constructor */
	public Favors(Integer userId, Integer collectId, Date collectTime) {
		this.userId = userId;
		this.collectId = collectId;
		this.collectTime = collectTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCollectId() {
		return this.collectId;
	}

	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}

	public Date getCollectTime() {
		return this.collectTime;
	}

	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}

}