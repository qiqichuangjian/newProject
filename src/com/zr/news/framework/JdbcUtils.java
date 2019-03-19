package com.zr.news.framework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @Acthor:孙琪; date:2019/3/11;
 */
public class JdbcUtils {
    private static String driverClassName="com.mysql.cj.jdbc.Driver";
    private static String url="jdbc:mysql:///news?serverTimezone=GMT%2B8";
    private static String user="root";
    private static String password="123456";
    private static Connection connection;
    public static Connection getConnection(){
        try {
            Class.forName(driverClassName);
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void close(){
        if(connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }
}
