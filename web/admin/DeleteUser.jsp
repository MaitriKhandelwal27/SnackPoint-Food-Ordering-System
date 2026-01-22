<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<jsp:useBean id="st" class="vgt.models.User"></jsp:useBean>
<jsp:setProperty property="*" name="st"/>

<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

<%
String msg = st.Delete();

if(msg != null && msg.equalsIgnoreCase("success")) {
%>
    <div class="alert alert-success text-center">
        <h5 class="mb-2">Student Deleted Successfully</h5>

        <a href="ShowStudent.jsp" class="btn btn-primary mt-2">
            Back to Student List
        </a>
    </div>
<%
} else {
%>
    <div class="alert alert-danger text-center">
        <h5>Unable to delete student.</h5>

        <a href="ShowStudent.jsp" class="btn btn-secondary mt-2">
            Back
        </a>
    </div>
<%
}
%>

</div>
