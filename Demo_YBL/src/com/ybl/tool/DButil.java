package com.ybl.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DButil {
	private static final String USERNAME = "root";//数据库用户名
    private static final String PASSWORD = "123456";//数据库密码
    private static final String DRIVER = "com.mysql.jdbc.Driver";//驱动信息
    private static final String URL = "jdbc:mysql://localhost:3306/ybl";//数据库地址
    
    private static Connection connection = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    
    public DButil() {
        try {
            Class.forName(DRIVER);
            System.out.println("Connect database Successlly！");
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
     * 得到数据库连接
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
