package com.chioma.ezenwoye.week6taskchioma.controller;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;
import com.chioma.ezenwoye.week6taskchioma.dao.UserDao;
import com.chioma.ezenwoye.week6taskchioma.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/Login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if(email == null || email.equals(" ")){
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }
        if(password == null || password.equals(" ")){
            request.setAttribute("status", "invalidPassword");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }

        try (PrintWriter out = response.getWriter()) {

            UserDao udao = new UserDao(DBCon.getConnection());
            User user = udao.userLogin(email, password);
            if("chiomaezenwoye@gmail.com".equals(email) && "4567".equals(password)){
                session.setAttribute("username", email);
                dispatcher = request.getRequestDispatcher("adminMainPage.jsp");
                dispatcher.forward(request, response);
            }else if (user != null) {
//                request.getSession().setAttribute("auth", user);
                session.setAttribute("auth", user);
                session.setAttribute("Email", email);

//				System.out.print("user logged in");
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }







//        try{
//
//            PreparedStatement pst = DBCon.getConnection().prepareStatement("SELECT * FROM users WHERE email =? AND password =? ");
//            pst.setString(1, email);
//            pst.setString(2, password);
//
//            ResultSet rs = pst.executeQuery();
//
//             if(rs.next()){
//                 session.setAttribute("name", rs.getString("username"));
//                 dispatcher = request.getRequestDispatcher("index.jsp");
//             }else{
//                 request.setAttribute("status", "failed");
//                 dispatcher = request.getRequestDispatcher("login.jsp");
//
//             }
//                 dispatcher.forward(request, response);
//        }catch(Exception e){
//            e.printStackTrace();
//        }
    }
}
