package com.ybl.model;

/**
 * Registinfo entity. @author MyEclipse Persistence Tools
 */

public class Registinfo implements java.io.Serializable {

	// Fields

	private String email;
	private String password;
	private String code;

	// Constructors

	/** default constructor */
	public Registinfo() {
	}

	/** full constructor */
	public Registinfo(String password, String code) {
		this.password = password;
		this.code = code;
	}

	// Property accessors

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Registinfo [email=" + email + ", password=" + password
				+ ", code=" + code + "]";
	}
	
	

}