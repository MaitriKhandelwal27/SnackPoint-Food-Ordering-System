<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

  <h3 class="text-center mb-4">💰 User Wallet</h3>

<%
String user_id = request.getParameter("user_id");
int uid=Integer.parseInt(user_id);
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
/* GET BALANCE */
double balance = 0;
String sql1 = "SELECT balance FROM users WHERE user_id=?";
PreparedStatement p1 = cn.prepareStatement(sql1);
p1.setInt(1, uid);
ResultSet r1 = p1.executeQuery();

if(r1.next()) {
    balance = r1.getDouble("balance");

%>

  <div class="card shadow-sm text-center">
    <div class="card-body">

      <h5 class="card-title">Wallet Balance</h5>

      <p class="display-6 text-success">
        Rs. <%=balance%>
      </p>

      <form method="post" action="AddWallet.jsp">
        <input type="hidden" name="user_id" value="<%=uid%>">

        <button type="submit" class="btn btn-primary">
          Add Balance
        </button>
      </form>

    </div>
  </div>

</div>
<%
}
%>