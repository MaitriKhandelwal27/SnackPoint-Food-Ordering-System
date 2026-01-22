<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<jsp:useBean id="aa" class="vgt.models.admin"/>
<jsp:setProperty property="*" name="aa"/>

<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
String msg = aa.savedata();
boolean success = msg != null && msg.toLowerCase().contains("success");
%>

<% if(success) { %>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Admin Registered Successfully</h5>
        <p><%=msg%></p>

        <a href="AdminHome.jsp" class="btn btn-primary mt-2">
            Go to Dashboard
        </a>
    </div>
<% } else { %>
    <div class="alert alert-danger text-center">
        <h5>Admin Registration Failed</h5>
        <p><%=msg%></p>

        <a href="AddAdmin.jsp" class="btn btn-secondary mt-2">
            Try Again
        </a>
    </div>
<% } %>

</div>
