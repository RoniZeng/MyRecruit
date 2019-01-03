package com.ybl.dao;

import com.ybl.model.Experience;

public class ExperienceDao extends BaseHibernateDao{
	
	public Experience selectById(Integer id) {
		return (Experience) super.get(Experience.class, id);
	}
	public void inser(Experience experience) {
		super.add(experience);
	}
	
	public static void main(String[] args) {
//		Experience experience = new Experience();
//		ExperienceDao dao = new ExperienceDao();
//		experience.setCompanyName("丁香园");
//		experience.setDepartment("营销部");
//		experience.setDescription("科普");
//		experience.setDuty("助人为乐");
//		dao.inser(experience);
//		experience = dao.selectById(4);
//		System.out.println(experience.getCompanyName() + " " +experience.getDepartment());
	}
}
