<jsp:useBean id="aa" class="vgt.models.Food"/>
<jsp:setProperty property="*" name="aa"/>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
    <div class="card shadow-lg border-0 text-center p-4" style="max-width: 450px; border-radius: 15px;">
        <div class="card-body">
            <div class="mb-3">
                <span style="font-size: 50px;">✅</span>
            </div>
            <h4 class="fw-bold">Status</h4>
            <p class="text-muted">Operation completed successfully</p>

            <div class="alert alert-success rounded-pill">
                <strong><%= aa.savedata() %></strong>
            </div>

            <a href="AdminHome.jsp" class="btn btn-primary mt-3 px-4 rounded-pill">
                Go to Dashboard
            </a>
        </div>
    </div>
</div>

<%@include file="AdminFooter.jsp" %>
