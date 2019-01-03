package com.ybl.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Set reciritments = new HashSet();
	private Set positions = new HashSet();

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String name, Set reciritments, Set positions) {
		this.name = name;
		this.reciritments = reciritments;
		this.positions = positions;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set getReciritments() {
		return this.reciritments;
	}

	public void setReciritments(Set reciritments) {
		this.reciritments = reciritments;
	}

	public Set getPositions() {
		return this.positions;
	}

	public void setPositions(Set positions) {
		this.positions = positions;
	}

}