package com.chioma.ezenwoye.week6taskchioma.controller;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;
import com.chioma.ezenwoye.week6taskchioma.dao.ProductDao;
import com.chioma.ezenwoye.week6taskchioma.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProductServlet", value = "/AddProduct")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("addProduct.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Product product = new Product();
        product.setName(productName);
        product.setCategory(category);
        product.setPrice(Double.valueOf(price));
        product.setQuantity(quantity);
        ProductDao productDao = new ProductDao(DBCon.getConnection());
        if(productDao.addProduct(product)){
            request.setAttribute("Success", "Product Added successfully");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }

    }

}
