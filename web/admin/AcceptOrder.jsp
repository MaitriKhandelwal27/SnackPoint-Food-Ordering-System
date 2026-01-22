<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>

<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
int order_id = Integer.parseInt(request.getParameter("order_id"));

DbSettings ds=new DbSettings();
Connection cn=ds.connect();
/* UPDATE ORDER STATUS */
String sql =
    "UPDATE orders SET order_status='ACCEPTED' WHERE order_id=?";

PreparedStatement p = cn.prepareStatement(sql);
p.setInt(1, order_id);

int a = p.executeUpdate();


if(a == 1) {
%>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Order Accepted Successfully</h5>

        <a href="AdminHome.jsp" class="btn btn-primary mt-2">
            Back to Orders
        </a>
    </div>
<%
} else {
%>
    <div class="alert alert-danger text-center">
        <h5>Could not update order.</h5>

        <a href="AdminHome.jsp" class="btn btn-secondary mt-2">
            Back
        </a>
    </div>
<%
}
%>

</div>
