package com.chioma.ezenwoye.week6taskchioma.controller;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegistrationServlet", value = "/register")
public class  RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        String phoneNo = request.getParameter("contact");

        RequestDispatcher dispatcher = null;
        Connection con = null;

        if(username == null || username.equals("")){
            request.setAttribute("status", "invalidUsername");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);

        }
        if(email == null || email.equals("")){
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);

        }
        if(password == null || password.equals("")){
            request.setAttribute("status", "invalidPassword");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);

        } else if(!password.equals(re_pass)){
            request.setAttribute("status", "invalidRePassword");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);


        }

        if(phoneNo == null || phoneNo.equals(" ")){
            request.setAttribute("status", "invalidPhoneNo");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);

        }



        try{

            PreparedStatement pst = DBCon.getConnection().prepareStatement("INSERT INTO users(username,password,email,phoneNo) VALUES(?,?,?,?)");
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, email);
            pst.setString(4, phoneNo);

            int count = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("registration.jsp");


            if(count > 0){
                request.setAttribute("status", "success");
            }else{
                request.setAttribute("status","failed");
            }
            dispatcher.forward(request,response);

        }catch(Exception e){
            e.getMessage();

        }finally{
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }
}
