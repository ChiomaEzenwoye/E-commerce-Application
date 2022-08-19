
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.User" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Cart" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.dao.ProductDao" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.connection.DBCon" %>

<%
    DecimalFormat decimalFormat = new DecimalFormat("#.##");
    request.setAttribute("decimalFormat", decimalFormat);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> productCart = null;

    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DBCon.getConnection());

        productCart = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Vanilla Store</title>
    <style type="text/css">
        .table tbody td{
            vertical-align: middle;
        }
        .btn-incre, .btn-decre{
            box-shadow: none;
            font-size: 25px;
        }
    </style>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>

<div class="container my-3">
    <div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?decimalFormat.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Buy Now</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (cart_list != null) {
                for (Cart c : productCart) {
        %>
        <tr>
            <td><%=c.getName()%></td>
            <td><%=c.getCategory()%></td>
            <td><%= decimalFormat.format(c.getPrice())%></td>
            <td>
                <form action="order-now" method="post" class="form-inline">
                    <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                    <div class="form-group d-flex justify-content-between">
                        <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
                        <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly>
                        <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                </form>
            </td>
            <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
        </tr>

        <%
                }}%>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>