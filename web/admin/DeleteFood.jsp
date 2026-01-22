<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>

<jsp:useBean id="del" class="vgt.models.Food"/>
<jsp:setProperty property="*" name="del"/>
<!-- ADMIN NAVBAR -->
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminFooter.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
String msg = del.Delete();

if(msg != null && msg.equalsIgnoreCase("success")) 
{
%>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Food Deleted Successfully</h5>

        <a href="ShowFood.jsp" class="btn btn-primary mt-2">
            Back to Food List
        </a>
    </div>
<%
} else {
%>
    <div class="alert alert-danger text-center">
        <h5>Unable to delete food.</h5>

        <a href="ShowFood.jsp" class="btn btn-secondary mt-2">
            Back
        </a>
    </div>
<%
}
%>

</div>
