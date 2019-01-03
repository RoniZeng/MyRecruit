package com.ybl.dao;

import java.sql.*;
import java.util.ArrayList;

import com.ybl.tool.DButil;

public class DatabaseOperation {
	/**
	 * 
	 * @param objects 
	 * ����ɱ����������������δ֪
	 * ���÷���ʱָ������Ĳ���������strings��ʵ��һ�����飬�䳤�ȼ������ĸ���
	 */
	/**
	 * @param tableName
	 * @param objects Object...objects(��Ϊ�ɱ�������β�)���ֲ����������ڲ�ȷ����������������µ�һ�ֶ�̬������ʽ
	 * @return true or false
	 */
	public static boolean hasFindFromTable(String tableName, Object... objects) { 
		if ((objects.length & 1) == 1) //����һ��Ϊfalse
			return false;
		String sql = "select * from " + tableName + " where "; //SQL��ѯ��䣬��������tableName
		if (objects.length == 0) { //���������Ϊ��
			sql = sql + " 1 = 1 ";  //ȫ������
		} else {
			sql = sql + (String) objects[0] + " = ? ";  //���򣬴���ĵ�һ��������ֵռλ����
			for (int i = 2; i < objects.length; i += 2) {
				sql = sql + " and " + (String) objects[i] + " = ? ";
			}
		}
		Connection connection = DButil.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			int id = 0;
			for (int i = 1; i < objects.length; i += 2) {
				statement.setObject(++id, objects[i]);
			}
			return statement.executeQuery().next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean update(String tableName, int updatenum,
			Object... objects) {
		if ((objects.length & 1) == 1 || updatenum * 2 > objects.length
				|| updatenum == 0)
			return false;
		String sql = "update " + tableName + " set " + (String) objects[0]
				+ " = ? ";
		for (int i = 1, idx = 2; i < updatenum; i++, idx += 2) {
			sql = sql + " , " + (String) objects[idx] + " = ? ";
		}

		Connection connection = DButil.getConnection();
		try {
			sql = sql + " where ";
			if (updatenum * 2 == objects.length) {
				sql = sql + " 1 = 1";
			} else {
				for (int i = updatenum * 2; i < objects.length; i += 2) {
					sql = sql + (String) objects[i] + " = ? ";
				}
			}
			PreparedStatement statement = connection.prepareStatement(sql);
			for (int i = 1, id = 1; i < objects.length; i+=2, id++) {
				statement.setObject(id, objects[i]);
			}
			return statement.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static boolean insert(String tableName, Object... objects) {
		if (objects.length <= 0)
			return false;
		String sql = "insert into " + tableName + " values ( ? ";
		for (int i = 1; i < objects.length; i++) {
			sql = sql + " , ? ";
		}
		sql = sql + " ) ";
		Connection connection = DButil.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				statement.setObject(i + 1, objects[i]);
			}
			return statement.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	
	public static boolean delete(String tableName, Object... objects) {
		String sql = "delete from " + tableName + " where ";
		if (objects.length < 0) {
			sql = sql + " 1 = 1 ";
		} else {
			sql = sql + (String) objects[0] + " = ? ";
			for (int i = 2; i < objects.length; i += 2) {
				sql = sql + " and " + (String) objects[i]+" = ? ";
			}
		}
		Connection connection = DButil.getConnection();

		try {

			PreparedStatement statement = connection.prepareStatement(sql);
			int id = 0;
			for (int i = 1; i < objects.length; i += 2) {
				statement.setObject(++id, objects[i]);
			}
			return statement.executeUpdate()>0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//������������ֵ
	public static ArrayList<Object[]> select(String tableName,
			int selectColumnNum, Object... objects) {
		ArrayList<Object[]> result = new ArrayList<Object[]>();
		Object[] data;
		String sql = "select ";
		if (selectColumnNum <= 0) {
			sql = sql + " * from " + tableName;
		} else {
			sql = sql + (String)objects[0];
			for (int i = 1; i < selectColumnNum; i++) {
				sql = sql + " , "+(String)objects[i];
			}
			sql = sql + " from " + tableName;

		}
		Connection connection = DButil.getConnection();
		
		try {
			if (selectColumnNum < objects.length) {
				sql = sql + " where ";
				sql = sql + (String) objects[selectColumnNum] + " = ? ";
				for (int i = selectColumnNum+2; i < objects.length; i += 2) {
					sql = sql + " and "+(String) objects[i] + " = ? ";
				}
			}
			else if(selectColumnNum==objects.length){
				sql = sql +" where 1=1 ";
			}
			PreparedStatement statement = connection.prepareStatement(sql);
			int id = 0;
			
			for (int i = selectColumnNum + 1; i < objects.length; i += 2) {
				statement.setObject(++id, objects[i]);
			}
			ResultSet rs = statement.executeQuery();
			ResultSetMetaData rsMetaData = rs.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			data = new Object[columnCount];
			for (int i = 0; i < columnCount; i++) {
				data[i] = rsMetaData.getColumnName(i + 1);
			}
			result.add(data);
			while (rs.next()) {
				data = new Object[columnCount];
				for (int i = 0; i < columnCount; i++) {
					data[i] = rs.getObject(i + 1);
				}
				result.add(data);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	/*ģ����ѯ*/
	public static ArrayList<Object[]> fuzzySelect(String tableName,
			int selectColumnNum, Object... objects) {
		ArrayList<Object[]> result = new ArrayList<Object[]>();
		Object[] data;
		String sql = "select ";
		if (selectColumnNum <= 0) {
			sql = sql + " * from " + tableName;
		} else {
			sql = sql + (String)objects[0];
			for (int i = 1; i < selectColumnNum; i++) {
				sql = sql + " , "+(String)objects[i];
			}
			sql = sql + " from " + tableName;

		}
		Connection connection = DButil.getConnection();
		try {
			if (selectColumnNum == objects.length) {
				sql = sql + " where 1 = 1 ";
			} else {
				sql = sql + " where ";
				sql = sql + (String) objects[selectColumnNum] + " like ? ";
				for (int i = selectColumnNum+2; i < objects.length; i += 2) {
					sql = sql + " and "+(String) objects[i] + " like ? ";
				}

			}
			PreparedStatement statement = connection.prepareStatement(sql);
			int id = 0;
			
			for (int i = selectColumnNum + 1; i < objects.length; i += 2) {
				statement.setObject(++id, "%"+objects[i]+"%");
			}
			ResultSet rs = statement.executeQuery();
			ResultSetMetaData rsMetaData = rs.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			data = new Object[columnCount];
			for (int i = 0; i < columnCount; i++) {
				data[i] = rsMetaData.getColumnName(i + 1);
			}
			result.add(data);
			while (rs.next()) {
				data = new Object[columnCount];
				for (int i = 0; i < columnCount; i++) {
					data[i] = rs.getObject(i + 1);
				}
				result.add(data);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
}
