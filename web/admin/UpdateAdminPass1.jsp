<jsp:useBean id="Ad" class="vgt.models.admin"/>
<jsp:setProperty   property="*"  name="Ad"/>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%
   String npass=request.getParameter("npass");
   String opass=request.getParameter("opass");
   
    String msg=Ad.ChangePass(npass, opass, e1);
    
%>


<div class="container d-flex justify-content-center mt-5">
    <div class="card shadow-lg p-4 text-center" style="width: 380px; border-radius: 12px;">
        <h5 class="fw-bold mb-3">Password Update Status</h5>
        <hr>

        <div class="alert alert-info">
            <%= msg %>
        </div>

        <a href="AdminHome.jsp" class="btn btn-primary mt-2">
            Back to Dashboard
        </a>
    </div>
</div>