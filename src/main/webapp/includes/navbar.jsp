<%--
  Created by IntelliJ IDEA.
  User: dec
  Date: 09/08/2022
  Time: 03:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Vanilla Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="adminLogin.jsp.jsp">Admin</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
<%--                    <%--%>
<%--				if (auth != null) {--%>
<%--				%>--%>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="Logout">Logout</a></li>
<%--                    <%--%>
<%--				} else {--%>
<%--				%>--%>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
<%--<%--%>
<%--    }--%>
<%--%>--%>

            </ul>
        </div>
    </div>
</nav>