package com.ybl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

public class Employee implements java.io.Serializable {
	
	private Integer id;
	private String name;
	private String email;
	private String image;
	private Integer sex;
	private Date birthday;
	private String tel;
	private String city;
	private String location;
	private Integer experience;
	private Integer degree;
	private Integer expSalary;
	private String expCity;
	private String expJob;
	private Integer type;
	private Resume resume;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Integer getExperience() {
		return experience;
	}
	public void setExperience(Integer experience) {
		this.experience = experience;
	}
	public Integer getDegree() {
		return degree;
	}
	public void setDegree(Integer degree) {
		this.degree = degree;
	}
	public Integer getExpSalary() {
		return expSalary;
	}
	public void setExpSalary(Integer expSalary) {
		this.expSalary = expSalary;
	}
	public String getExpCity() {
		return expCity;
	}
	public void setExpCity(String expCity) {
		this.expCity = expCity;
	}
	public String getExpJob() {
		return expJob;
	}
	public void setExpJob(String expJob) {
		this.expJob = expJob;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	public Employee(Integer id, String name, String email, String image,
			Integer sex, Date birthday, String tel, String city,
			String location, Integer experience, Integer degree,
			Integer expSalary, String expCity, String expJob, Integer type,
			Resume resume) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.image = image;
		this.sex = sex;
		this.birthday = birthday;
		this.tel = tel;
		this.city = city;
		this.location = location;
		this.experience = experience;
		this.degree = degree;
		this.expSalary = expSalary;
		this.expCity = expCity;
		this.expJob = expJob;
		this.type = type;
		this.resume = resume;
	}
	public Employee() {
		super();
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", email=" + email
				+ ", image=" + image + ", sex=" + sex + ", birthday="
				+ birthday + ", tel=" + tel + ", city=" + city + ", location="
				+ location + ", experience=" + experience + ", degree="
				+ degree + ", expSalary=" + expSalary + ", expCity=" + expCity
				+ ", expJob=" + expJob + ", type=" + type + ", resume="
				+ resume + "]";
	} 
	
}