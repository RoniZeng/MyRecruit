package com.ybl.model;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String email;
	private Integer identity;
	private String password;	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Userinfo() {
		super();
	}
	public Userinfo(Integer id, String email, Integer identity,
			String password) {
		super();
		this.id = id;
		this.email = email;
		this.identity = identity;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Userinfo [id=" + id + ", email=" + email + ", identity="
				+ identity + ", password=" + password + "]";
	}
	
	
	
}