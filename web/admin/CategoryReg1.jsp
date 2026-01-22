<jsp:useBean id="aa" class="vgt.models.Category"/>
<jsp:setProperty property="*" name="aa"/>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5 d-flex justify-content-center">
    <div class="card shadow p-4 text-center" style="max-width: 500px; width: 100%;">
        <h5 class="text-success">
            <%= aa.saveData() %>
        </h5>
    </div>
</div>

<%@include file="AdminFooter.jsp" %>
