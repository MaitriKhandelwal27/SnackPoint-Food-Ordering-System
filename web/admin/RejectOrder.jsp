<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
String oid =request.getParameter("order_id");
int order_id=Integer.parseInt(oid);
String amt=request.getParameter("amount");
Double amount=Double.parseDouble(amt);
DbSettings ds=new DbSettings();
Connection cn=ds.connect();

/* UPDATE ORDER STATUS */
String sql ="UPDATE orders SET order_status='REJECTED' WHERE order_id=?";

PreparedStatement p = cn.prepareStatement(sql);
p.setInt(1, order_id);

String sql_uid="select user_id from orders where order_id=?";
PreparedStatement p1=cn.prepareStatement(sql_uid);
p1.setInt(1,order_id);
ResultSet rs=p1.executeQuery();
int user_id;
if(rs.next())
{
    user_id=rs.getInt("user_id");
    int a = p.executeUpdate();

    String sql1="update users set balance=balance+? where user_id=?";
    PreparedStatement p2=cn.prepareStatement(sql1);
    p2.setDouble(1,amount);
    p2.setInt(2,user_id);
    int b = p2.executeUpdate();

    String sql2="insert into transactions (user_id, amt, trans_type, trans_date) values (?,?,?,NOW())";
    PreparedStatement p3=cn.prepareStatement(sql2);
    p3.setInt(1,user_id);
    p3.setDouble(2,amount);
    p3.setString(3,"Refunded");
    int c = p3.executeUpdate();
    if(a == 1&&b==1&&c==1) 
    {
%>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Order Rejected Successfully</h5>

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
}
%>

</div>
