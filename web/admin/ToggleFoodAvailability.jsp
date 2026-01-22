<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
int food_id = Integer.parseInt(request.getParameter("food_id"));
boolean currentStatus =
        Boolean.parseBoolean(request.getParameter("current_status"));

boolean newStatus = !currentStatus;

DbSettings ds=new DbSettings();
Connection cn=ds.connect();
String sql ="UPDATE food_items SET is_available=? WHERE food_id=?";

PreparedStatement ps = cn.prepareStatement(sql);
ps.setBoolean(1, newStatus);
ps.setInt(2, food_id);

int updated = ps.executeUpdate();
cn.close();

if(updated == 1) {
%>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Food Availability Updated</h5>

        <p>
            New Status :
            <strong>
                <%= newStatus ? "Available" : "Not Available" %>
            </strong>
        </p>

        <a href="ShowFood.jsp" class="btn btn-primary mt-2">
            Back to Food List
        </a>
    </div>
<%
} else {
%>
    <div class="alert alert-danger text-center">
        <h5>Could not update food status.</h5>

        <a href="ShowFood.jsp" class="btn btn-secondary mt-2">
            Back
        </a>
    </div>
<%
}
%>

</div>
