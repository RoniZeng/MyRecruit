package com.ybl.model;

/**
 * Position entity. @author MyEclipse Persistence Tools
 */

public class Position implements java.io.Serializable {

	// Fields

	private String name;
	private Category category;

	// Constructors

	/** default constructor */
	public Position() {
	}

	/** full constructor */
	public Position(Category category) {
		this.category = category;
	}

	// Property accessors

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}