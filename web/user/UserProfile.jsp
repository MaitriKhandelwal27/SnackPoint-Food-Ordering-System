<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp" %>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@include file="UserFooter.jsp" %>
<div class="container mt-5">

  <h3 class="text-center mb-4"> My Profile</h3>

  <%
  DbSettings ds=new DbSettings();
Connection cn=ds.connect();
  PreparedStatement p1 =
      cn.prepareStatement("SELECT * FROM users WHERE email=?");
  p1.setString(1, e1);
  ResultSet r1 = p1.executeQuery();

  if(r1.next()) {

      int id = r1.getInt("user_id");
      String name = r1.getString("name");
      String contact = r1.getString("contact");
  %>

  <div class="card shadow-lg mx-auto p-4" 
     style="max-width: 500px; border-radius: 12px;">

  <div class="text-center mb-3">
    <h4 class="fw-bold">User Profile</h4>
    <hr>
  </div>

  <div class="mb-2">
    <strong>User ID:</strong>
    <span class="ms-2"><%= id %></span>
  </div>

  <div class="mb-2">
    <strong>Name:</strong>
    <span class="ms-2"><%= name %></span>
  </div>

  <div class="mb-2">
    <strong>Contact:</strong>
    <span class="ms-2"><%= contact %></span>
  </div>

  <div class="mb-3">
    <strong>Email:</strong>
    <span class="ms-2"><%= e1 %></span>
  </div>

  <form method="post" action="UpdateUserPass.jsp" class="text-center">
    <button class="btn btn-primary w-100">
      Update Password
    </button>
  </form>

</div>
<%
  }
%>