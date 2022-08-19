package com.chioma.ezenwoye.week6taskchioma.controller;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;
import com.chioma.ezenwoye.week6taskchioma.dao.OrderDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "CancelOrderServlet", value = "/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  {

        try(PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            if(id != null) {
                OrderDao orderDao = new OrderDao(DBCon.getConnection());
                orderDao.cancelOrder(Integer.parseInt(id));
            }
            response.sendRedirect("orders.jsp");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        doGet(request, response);
}
}
