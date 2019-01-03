package com.ybl.dao;

import java.lang.reflect.Field;
import java.util.ArrayList;


public class DAO {
	protected String tableName;

	public DAO() {

	}

	public DAO(String tableName) {
		this.tableName = tableName;
	}

	public Object[] getValue(Object obj, String[] strings) {
		Object[] result=new Object[strings.length*2];
		int idx = 0;
		for (int i = 0; i < strings.length; i++) {
			result[idx++] = strings[i];
			try {
				Field field = obj.getClass().getDeclaredField(strings[i]);
				field.setAccessible(true);
				result[idx++] = field.get(obj);

			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}

		return result;
	}
	
	//insert into tablename(obj's value);
	public boolean insert(Object obj) {
		Field[] fields = obj.getClass().getDeclaredFields();
		Object[] objects = new Object[fields.length];
		for (int i = 0; i < fields.length; i++) {
			fields[i].setAccessible(true);
			try {
				objects[i] = fields[i].get(obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return DatabaseOperation.insert(tableName, objects);
	}
	
	//select * from tablename where strings[0]==obj.getstrings[0] and strings[1]=obj.getstrings[1]
	//if have return true
	public boolean find(Object obj, String... strings) {
		Object[] result =getValue(obj, strings);
		if (result!=null) {
			return DatabaseOperation.hasFindFromTable(tableName, result);
		}
		return false;
	}
	
	//delete from tablename where strings[0]==obj.getstrings[0] and strings[1]=obj.getstrings[1]
	public boolean delete(Object obj, String... strings) {
		Object[] result =getValue(obj, strings);
		if (result!=null) {
			return DatabaseOperation.delete(tableName, result);
		}
		return false;
	}

	//updatenum=1 strings.length=3
	//update tablename set strings[0]=obj.getstrings[0] where strings[1]=obj.getstrings[1] and strings[2]=obj.getstrings[2]
	public boolean update(Object obj, int updatenum, String... strings) {
		Object[] result =getValue(obj, strings);
		if (result!=null) {
			return DatabaseOperation.update(tableName, updatenum, result);
		}
		return false;
	}
	
	//selectColumnNum=2 objects.length=6
	//select objects[0],objects[1] from tablename where object[2]=object[3] and object[4]=object[5]
	public ArrayList<Object[]> select(int selectColumnNum, Object... objects) {
		return DatabaseOperation.select(tableName, selectColumnNum, objects);
	}

	public ArrayList<Object[]> fuzzySelect(int selectColumnNum,
			Object... objects) {
		return DatabaseOperation.fuzzySelect(tableName, selectColumnNum,
				objects);
	}
}
