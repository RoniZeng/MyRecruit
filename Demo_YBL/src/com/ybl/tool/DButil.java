package com.ybl.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DButil {
	private static final String USERNAME = "root";//���ݿ��û���
    private static final String PASSWORD = "123456";//���ݿ�����
    private static final String DRIVER = "com.mysql.jdbc.Driver";//������Ϣ
    private static final String URL = "jdbc:mysql://localhost:3306/ybl";//���ݿ��ַ
    
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    public DButil() {
        try {
            Class.forName(DRIVER);
            System.out.println("Connect database Successlly��");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static void Conn(){
        if(resultSet != null){
            try{
                resultSet.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(statement != null){
            try{
                statement.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(connection != null){
            try{
                connection.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
    /**
     * �õ����ݿ�����
     * @return connection
     */
    public static Connection getConnection() {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
