
<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp" %>
<%
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@include file="UserFooter.jsp" %>
<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
int user_id = 0;
PreparedStatement psUser =
        cn.prepareStatement("SELECT user_id FROM users WHERE email=?");
psUser.setString(1, e1);
ResultSet rsUser = psUser.executeQuery();
if(rsUser.next()) {
    user_id = rsUser.getInt("user_id");
}

/* ORDER HISTORY */
PreparedStatement psHistory =
        cn.prepareStatement(
            "SELECT o.order_id, f.food_name, o.quantity, o.price, " +
            "o.order_status, o.order_time " +
            "FROM orders o JOIN food_items f " +
            "ON o.food_id = f.food_id " +
            "WHERE o.user_id=? " +
            "ORDER BY o.order_time DESC"
        );
psHistory.setInt(1, user_id);
ResultSet rs = psHistory.executeQuery();
%>

<div class="container mt-5">

  <h3 class="text-center mb-4">My Orders</h3>

  <%
  if(!rs.isBeforeFirst()) {
  %>
      <div class="alert alert-info text-center">
          You have not placed any orders yet.
      </div>
  <%
  } else {
  %>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">
      <thead class="table-primary">
        <tr>
          <th>Order ID</th>
          <th>Food</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Status</th>
          <th>Order Time</th>
        </tr>
      </thead>

      <tbody>

<%
while(rs.next()) {
%>

<tr>
  <td class="fw-semibold">
      #<%=rs.getInt("order_id")%>
  </td>

  <td>
      <%=rs.getString("food_name")%>
  </td>

  <td>
      <%=rs.getInt("quantity")%>
  </td>

  <td class="fw-bold text-success">
      Rs. <%=rs.getDouble("price")%>
  </td>

  <td>
      <%
      String status = rs.getString("order_status");
      if("PENDING".equalsIgnoreCase(status)) {
      %>
          <span class="badge bg-warning text-dark">Pending</span>
      <%
      } else if("COMPLETED".equalsIgnoreCase(status)) {
      %>
          <span class="badge bg-success">Completed</span>
      <%
      } else {
      %>
          <span class="badge bg-secondary"><%=status%></span>
      <%
      }
      %>
  </td>

  <td class="small text-muted">
      <%=rs.getTimestamp("order_time")%>
  </td>
</tr>

<%
}
cn.close();
%>

      </tbody>
    </table>
  </div>

  <div class="text-center mt-4">
    <a href="UserHome.jsp" class="btn btn-outline-primary">
      Get More Food
    </a>
  </div>

  <%
  }
  %>

</div>

</body>
</html>
