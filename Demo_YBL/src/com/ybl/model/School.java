package com.ybl.model;

import java.util.HashSet;
import java.util.Set;

/**
 * School entity. @author MyEclipse Persistence Tools
 */

public class School implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String province;
	private String city;
	private Integer is985or211;
	private Set educations = new HashSet();

	// Constructors

	/** default constructor */
	public School() {
	}

	/** full constructor */
	public School(String name, String province, String city,
			Integer is985or211, Set educations) {
		this.name = name;
		this.province = province;
		this.city = city;
		this.is985or211 = is985or211;
		this.educations = educations;
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

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getIs985or211() {
		return this.is985or211;
	}

	public void setIs985or211(Integer is985or211) {
		this.is985or211 = is985or211;
	}

	public Set getEducations() {
		return this.educations;
	}

	public void setEducations(Set educations) {
		this.educations = educations;
	}

}