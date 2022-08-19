package com.chioma.ezenwoye.week6taskchioma.dao;

import com.chioma.ezenwoye.week6taskchioma.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;



    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;

        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }


}
