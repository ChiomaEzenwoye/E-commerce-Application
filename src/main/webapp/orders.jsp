<%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 10/08/2022
  Time: 04:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@page import="java.text.DecimalFormat"%>

<%@page import="java.util.*"%>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.User" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Order" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.dao.OrderDao" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.connection.DBCon" %>
<%@ page import="com.chioma.ezenwoye.week6taskchioma.model.Cart" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao orderDao  = new OrderDao(DBCon.getConnection());
        orders = orderDao.userOrders(auth.getId());
    }else{
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">    <title>My Cart</title>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
<div class="container">
    <div class="card-header my-3">All Orders</div>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>

        <%
            if(orders != null){
                for(Order o:orders){%>
        <tr>
            <td><%=o.getDate() %></td>
            <td><%=o.getName() %></td>
            <td><%=o.getCategory() %></td>
            <td><%=o.getQunatity() %></td>
            <td><%=dcf.format(o.getPrice()) %></td>
            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
        </tr>
        <%}
        }
        %>

        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script></body>
</body>
</html>
