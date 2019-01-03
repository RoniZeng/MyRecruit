package com.ybl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */

public class Company implements java.io.Serializable {
	
	private Integer id;
	private String name;
	private String email;
	private String logo;
	private Date startDay;
	private String website;
	private String location;
	private String field;
	private Integer size;
	private String introduce;
	private String map;
	private String photo;
	private Set reciritments = new HashSet(); //一个公司多个职位
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Set getReciritments() {
		return reciritments;
	}
	public void setReciritments(Set reciritments) {
		this.reciritments = reciritments;
	}
	public Company(Integer id, String name, String email, String logo,
			Date startDay, String website, String location, String field,
			Integer size, String introduce, String map, String photo,
			Set reciritments) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.logo = logo;
		this.startDay = startDay;
		this.website = website;
		this.location = location;
		this.field = field;
		this.size = size;
		this.introduce = introduce;
		this.map = map;
		this.photo = photo;
		this.reciritments = reciritments;
	}
	public Company() {
		super();
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", name=" + name + ", email=" + email
				+ ", logo=" + logo + ", startDay=" + startDay + ", website="
				+ website + ", location=" + location + ", field=" + field
				+ ", size=" + size + ", introduce=" + introduce + ", map="
				+ map + ", photo=" + photo + ", reciritments=" + reciritments
				+ "]";
	}
	

}