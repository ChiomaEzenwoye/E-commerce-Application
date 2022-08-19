package com.chioma.ezenwoye.week6taskchioma.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
    private static Connection connection = null;
    public static Connection getConnection() {
        if(connection == null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/vanillaStore?useSSL=false";
                String uname = "root";
                String pword = "@08036326683@";
                connection = DriverManager.getConnection(url, uname, pword);

            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }
        return connection;
    }
}
