
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.User" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.dao.ProductDao" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.connection.DBCon" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Product" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Cart" %><%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 10/08/2022
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%
    String auth = (String) request.getSession().getAttribute("username");
    if (auth == null) {
        response.sendRedirect("login.jsp");
    }
    ProductDao pd = new ProductDao(DBCon.getConnection());
    List<Product> products = pd.getAllProducts();
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>
<!-- Start Main Top -->
<header class="main-header">
    <!-- Start Navigation -->
    <%--  <%@include file="includes/navbar.jsp"%>--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Vanilla Jewelry Stores</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                              <li class="nav-item"><a class="nav-link" href="adminLogin.jsp">Admin</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>

                              <%
                                if (auth != null) {
                              %>
                    <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
                              <%
                              } else {
                              %>
                              <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                              <%
                                }
                              %>
                </ul>
            </div>
        </div>
    </nav>

</header>
<!-- End Main Top -->

<!-- Start Top Search -->
<%--<div class="top-search">--%>
<%--    <div class="container">--%>
<%--        <div class="input-group">--%>
<%--            <span class="input-group-addon"><i class="fa fa-search"></i></span>--%>
<%--            <input type="text" class="form-control" placeholder="Search">--%>
<%--            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- End Top Search -->

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start My Account  -->
<div class="my-account-box-main">
    <div class="container">
        <div class="my-account-page">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="addProduct.jsp"> <i class="fa fa-gift"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Add Products</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="AllProducts"><i class="fa fa-lock"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Update Product</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="AllProducts"> <i class="fa fa-location-arrow"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Delete Product</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="AllProducts"> <i class="fa fa-credit-card"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>View all product</h4>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <div class="col-lg-4 col-md-12">--%>
<%--                    <div class="account-box">--%>
<%--                        <div class="service-box">--%>
<%--                            <div class="service-icon">--%>
<%--                                <a href="#"> <i class="fab fa-paypal"></i> </a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>



        </div>
    </div>
</div>
