<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 600px;">

  <h3 class="text-center mb-4">✏️ Update User</h3>

<%
String email = request.getParameter("email");
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
String s1 = "SELECT * FROM users WHERE email=?";
PreparedStatement p1 = cn.prepareStatement(s1);
p1.setString(1, email);
ResultSet r1 = p1.executeQuery();

if(r1.next()) {

    String name = r1.getString("name");
    String address = r1.getString("address");
    String contact = r1.getString("contact");
%>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="UpdateUser1.jsp">

        <div class="mb-3">
          <label class="form-label">Name</label>
          <input type="text"
                 name="name"
                 value="<%=name%>"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Address</label>
          <input type="text"
                 name="address"
                 value="<%=address%>"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Contact</label>
          <input type="text"
                 name="contact"
                 value="<%=contact%>"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email"
                 name="email"
                 value="<%=email%>"
                 class="form-control"
                 readonly>
        </div>

        <div class="d-grid">
          <button type="submit"
                  class="btn btn-primary">
            Update User
          </button>
        </div>

      </form>

    </div>
  </div>

<%
}

%>

</div>
