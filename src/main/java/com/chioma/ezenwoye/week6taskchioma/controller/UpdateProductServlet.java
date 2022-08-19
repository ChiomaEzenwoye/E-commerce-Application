package com.chioma.ezenwoye.week6taskchioma.controller;

import com.chioma.ezenwoye.week6taskchioma.connection.DBCon;
import com.chioma.ezenwoye.week6taskchioma.dao.ProductDao;
import com.chioma.ezenwoye.week6taskchioma.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.function.DoubleUnaryOperator;

@WebServlet(name = "UpdateProductServlet", value = "/UpdateProduct")
public class UpdateProductServlet extends HttpServlet {
    ProductDao productDao = new ProductDao(DBCon.getConnection());
    int id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        Product product = productDao.getSingleProduct(id);
        request.setAttribute("name", product.getName());
        request.setAttribute("category", product.getCategory());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("quantity", product.getQuantity());


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("updateProduct.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Product product = new Product();
       //int productId = Integer.parseInt(request.getParameter("id"));
      String name = request.getParameter("name");
       String category = request.getParameter("category");
      int quantity = Integer.parseInt(request.getParameter("quantity"));
      double price = Double.parseDouble(request.getParameter("price"));
       product.setName(name);
       product.setPrice(price);
       product.setQuantity(quantity);
        product.setCategory(category);
        product.setId(id);

        try{
            if(productDao.updateProduct(product)){
                request.setAttribute("UpdateSuccess", "Product updated successfully");
               //response.sendRedirect("updateProduct.jsp");
                request.getRequestDispatcher("allProducts.jsp").forward(request, response);
            }
        }catch(Exception e){
            e.getMessage();

        }


    }
}
