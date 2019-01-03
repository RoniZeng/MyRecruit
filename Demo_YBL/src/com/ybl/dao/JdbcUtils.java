package com.ybl.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class JdbcUtils {
    private static final String USERNAME = "root";//数据库用户名
    private static final String PASSWORD = "123456";//数据库密码
    private static final String DRIVER = "com.mysql.jdbc.Driver";//驱动信息
    private static final String URL = "jdbc:mysql://localhost:3306/ybl";//数据库地址
    
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public JdbcUtils() {
        try {
            Class.forName(DRIVER);
            System.out.println("Connect database Successlly！");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 得到数据库连接
     * @return connection
     */
    public Connection getConnection() {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    /**
     * 更新操作（增删改）
     * @param sql
     * @param params
     * @return boolean
     * @throws SQLException
     */
    public boolean updateByPreparedStatement(String sql,List<Object> params) throws SQLException {
        boolean flag = false;
        int result = -1;
        statement = connection.prepareStatement(sql);
        int index = 1;
        if(params != null && !params.isEmpty()){
            for(int i=0; i<params.size(); i++){
                statement.setObject(index++, params.get(i));
            }
        }
        result = statement.executeUpdate();
        return flag = result > 0 ? true : false;
    }
    
    /**
     * 查询单条数据
     * @param sql
     * @param params
     * @return 
     * @throws SQLException
     */
    public Map<String,Object> findSimpleResult(String sql,List<Object> params) throws SQLException {
        Map<String,Object> map = new HashMap<String, Object>();
        statement = connection.prepareStatement(sql);
        int index = 1;
        if(params != null && !params.isEmpty()){
            for(int i=0; i<params.size(); i++){
                statement.setObject(index++, params.get(i));
            }
        }
        resultSet = statement.executeQuery();//返回查询结果
        ResultSetMetaData metaData = resultSet.getMetaData();
        int col_len = metaData.getColumnCount();
        while (resultSet.next()) {
            for(int i=0; i<col_len; i++){
                String cols_name = metaData.getCatalogName(i+1).toLowerCase();
                Object cols_value = resultSet.getObject(cols_name);
                if(cols_value == null){
                    cols_value = "";
                }
                map.put(cols_name, cols_value);
            }
        }
        return map;
    }
    
    /**
     * 查询多条数据
     * @param sql
     * @param params
     * @return 
     * @throws SQLException
     */
    public List<Map<String, Object>> findModeResult(String sql, List<Object> params) throws SQLException{
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        int index = 1;
        statement = connection.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            for(int i = 0; i<params.size(); i++){
                statement.setObject(index++, params.get(i));
            }
        }
        resultSet = statement.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int cols_len = metaData.getColumnCount();
        while(resultSet.next()){
            Map<String, Object> map = new HashMap<String, Object>();
            for(int i=0; i<cols_len; i++){
                String cols_name = metaData.getColumnName(i+1).toLowerCase();
                Object cols_value = resultSet.getObject(cols_name);
                if(cols_value == null){
                    cols_value = "";
                }
                map.put(cols_name, cols_value);
            }
            list.add(map);
        }
 
        return list;
    }

    /*
     * 通过反射机制查询单条记录
     * @param sql
     * @param params
     * @param cls
     * @return 
     * @throws Exception
     */
    public <T> T findSimpleRefResult(String sql, List<Object> params,
            Class<T> cls )throws Exception{
        T resultObject = null;
        int index = 1;
        statement = connection.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            for(int i = 0; i<params.size(); i++){
                statement.setObject(index++, params.get(i));
            }
        }
        resultSet = statement.executeQuery();
        ResultSetMetaData metaData  = resultSet.getMetaData();
        int cols_len = metaData.getColumnCount();
        while(resultSet.next()){
            //通过反射机制创建一个实例
            resultObject = cls.newInstance();
            for(int i = 0; i<cols_len; i++){
                String cols_name = metaData.getColumnName(i+1).toLowerCase();
                Object cols_value = resultSet.getObject(cols_name);
                if(cols_value == null){
                    cols_value = "";
                }
                Field field = cls.getDeclaredField(cols_name);
                field.setAccessible(true); //打开javabean的访问权限
                field.set(resultObject, cols_value);
            }
        }
        return resultObject;
 
    }

    
    /**
     * 通过反射查询多条记录
     * @param sql
     * @param params
     * @param cls
     * @return
     * @throws Exception
     */    
    public <T> List<T> findMoreRefResult(String sql, List<Object> params,
            Class<T> cls )throws Exception {
        List<T> list = new ArrayList<T>();
        int index = 1;
        statement = connection.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            for(int i = 0; i<params.size(); i++){
                statement.setObject(index++, params.get(i));
            }
        }
        resultSet = statement.executeQuery();
        ResultSetMetaData metaData  = resultSet.getMetaData();
        int cols_len = metaData.getColumnCount();
        while(resultSet.next()){
            //通过反射机制创建一个实例
            T resultObject = cls.newInstance();
            for(int i = 0; i<cols_len; i++){
                String cols_name = metaData.getColumnName(i+1).toLowerCase();
                Object cols_value = resultSet.getObject(cols_name);
                if(cols_value == null){
                    cols_value = "";
                }
                Field field = cls.getDeclaredField(cols_name);
                field.setAccessible(true); //打开javabean的访问权限
                field.set(resultObject, cols_value);
            }
            list.add(resultObject);
        }
        return list;
    }
    
    public void Conn(){
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

    public static void main(String[] args) {
        JdbcUtils jdbcUtils = new JdbcUtils();
        jdbcUtils.getConnection();
        /*******************增*********************/
        /*
        String sql = "insert into userinfo (username, password) values (?, ?)";
        List<Object> params = new ArrayList<Object>();
        params.add("02");
        params.add("02");
        try {
            boolean flag = jdbcUtils.updateByPreparedStatement(sql, params);
            System.out.println(flag);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            jdbcUtils.Conn();
        }
        */
 
        /*******************删*********************/
        //删除名字为张三的记录
        /*
        String sql = "delete from userinfo where username = ?";
        List<Object> params = new ArrayList<Object>();
        params.add("7");
        try {
            boolean flag = jdbcUtils.updateByPreparedStatement(sql, params);
            System.out.println(flag);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            jdbcUtils.Conn();
        }
        */
        
        /*******************改*********************/
        /*
        String sql = "update userinfo set password = ? where username = ? ";
        List<Object> params = new ArrayList<Object>();
        params.add("233333");
        params.add("01");
        boolean flag;
        try {
            flag = jdbcUtils.updateByPreparedStatement(sql, params);
            System.out.println(flag);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            jdbcUtils.Conn();
        }
        */
 
        /*******************查*********************/
        //不利用反射查询多个记录
        /*
        String sql2 = "select * from userinfo";
        List<Map<String, Object>> list;
        try {
            list = jdbcUtils.findModeResult(sql2, null);
            System.out.println(list); //list toSteing() 直接输出
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            jdbcUtils.Conn();
        }*/
        
         /*
         //不利用反射查询单个记录 （出不来！！！）
         String sql2 = "select * from userinfo where username = ?";
         Map<String,Object> map;//
         List<Object> params = new ArrayList<Object>();
         params.add("01");
         Map<String, Object> userinfo ;
         try{
             userinfo =  jdbcUtils.findSimpleResult(sql2, params);
             System.out.println(userinfo);
         }catch(Exception e){
             
         }finally{
             jdbcUtils.Conn();
         }
         */
        
        /*
        //利用反射查询单条记录
        String sql = "select * from userinfo where username = ? ";
        List<Object> params = new ArrayList<Object>();
        params.add("01");
        UserInfo userInfo;
        try {
            userInfo = jdbcUtils.findSimpleRefResult(sql, params, UserInfo.class);
            System.out.print(userInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            jdbcUtils.Conn();
        }
        */
        
        /*
        //利用反射查询多条记录
        String sql = "select * from userinfo where username = ?";
        List<Object> params = new ArrayList<Object>();
        params.add("02");
        List<UserInfo> list;
        try {
            list = jdbcUtils.findMoreRefResult(sql, params, UserInfo.class);
            System.out.print(list);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            jdbcUtils.Conn();
        }
        */
        
    }
}