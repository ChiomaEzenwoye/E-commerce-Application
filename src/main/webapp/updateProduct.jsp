<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.User" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.dao.ProductDao" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.connection.DBCon" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Cart" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 12/08/2022
  Time: 03:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
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
    <title> Vanilla Store</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></head></head>

<body>
<%
    String name = (String) request.getAttribute("name");
    String category = (String) request.getAttribute("category");
    Double price = (Double) request.getAttribute("price");
    int quantity = (int) request.getAttribute("quantity");
%>

<header>
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
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
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
    </nav></header>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="adminMainPage.jsp">Back</a></li>
                    <li class="breadcrumb-item active"> Update Page </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Contact Us  -->
<div class="contact-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-12">
                <div class="contact-form-right">
                    <form method="post" action="UpdateProduct">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<%=name%>" name="name" placeholder="Product" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<%=category%>"  name="category" placeholder="category" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="quantity" value="<%=quantity%>"  placeholder="productQuantity" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="price" placeholder="Price" value="<%=price%>" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="submit-button text-center">
                                    <button class="btn hvr-hover" id="submit" type="submit">Update</button>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex justify-content-center">
                                <h1 style="color: Green">${UpdateSuccess}</h1>
                            </div>
                            <a href="/AllProducts">return</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Cart -->

<%--<!-- Start Instagram Feed  -->--%>
<%--<div class="instagram-box">--%>
<%--    <div class="main-instagram owl-carousel owl-theme">--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-01.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-02.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-03.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-04.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-05.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-06.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-07.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-08.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-09.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="item">--%>
<%--            <div class="ins-inner-box">--%>
<%--                <img src="images/instagram-img-05.jpg" alt="" />--%>
<%--                <div class="hov-in">--%>
<%--                    <a href="#"><i class="fab fa-instagram"></i></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- End Instagram Feed  -->


<!-- Start Footer  -->
<footer>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</footer>
<!-- End Footer  -->

<!-- Start copyright  -->
<div class="footer-copyright">
    <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">Vanilla</a> Design By :
        <a href="https://html.design/">html design</a></p>
</div>
<!-- End copyright  -->

<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

<!-- ALL JS FILES -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="js/jquery.superslides.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="js/inewsticker.js"></script>
<script src="js/bootsnav.js."></script>
<script src="js/images-loded.min.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/baguetteBox.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/custom.js"></script>
</body>

</html>