<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>

<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

  <h3 class="text-center mb-4">💰 Add Wallet Balance</h3>

<%
String uidStr = request.getParameter("user_id");
    int user_id = Integer.parseInt(uidStr);
 DbSettings ds=new DbSettings();
Connection cn=ds.connect();
%>

  <!-- ADD BALANCE FORM -->
  <form method="post" class="card shadow-sm p-4" action="AddWallet1.jsp">

    <div class="mb-3">
      <label class="form-label">User ID</label>
      <input name="user_id" value="<%=user_id%>" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Add Balance Amount</label>
      <input type="number" name="balance" class="form-control" min="1" required>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-primary">
        Add Balance
      </button>
        
    </div>

  </form>

  <div class="text-center mt-3">
    <a href="ShowUser.jsp" class="btn btn-outline-secondary">
      Show Users
    </a>
  </div>

</div>

