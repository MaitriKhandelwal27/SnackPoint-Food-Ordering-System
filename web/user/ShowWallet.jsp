<%@page import="vgt.models.DbSettings"%>
<%@include file="UserSession.jsp"%>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@page import="java.sql.*"%>

<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
int user_id = 0;
double balance = 0.0;

PreparedStatement p1 =
   cn.prepareStatement("SELECT * FROM users WHERE email=?");
p1.setString(1, e1);
ResultSet r1 = p1.executeQuery();

if(r1.next()) 
{
   user_id = r1.getInt("user_id");

   PreparedStatement p2 =
       cn.prepareStatement("SELECT * FROM users WHERE user_id=?");
   p2.setInt(1, user_id);
   ResultSet r2 = p2.executeQuery();

   if(r2.next()) 
   {
       balance = r2.getDouble("balance");
   }
}
%>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
  <div class="card shadow-lg p-4 text-center" style="width: 350px; border-radius: 15px;">
    
    <div class="card-body">
      <h5 class="card-title mb-3">Your Wallet Balance</h5>

      <h2 class="text-success fw-bold">Rs <%= balance %></h2>

      <hr>

      <p class="text-muted">
        You cannot add money online.<br>
        To add balance, please submit cash to the admin.
      </p>

      <div class="alert alert-info small">
        Contact Admin for more details.
      </div>
    </div>

  </div>
</div>

<%@include file="UserFooter.jsp" %>
