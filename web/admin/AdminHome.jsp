<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="vgt.models.Order"%>
<%@page import="java.util.ArrayList"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminSession.jsp" %>
<div class="container mt-5">

  <h3 class="text-center mb-4">📦 Orders List</h3>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">

      <thead class="table-primary">
        <tr>
          <th>Order ID</th>
          <th>User ID</th>
          <th>Food</th>
          <th>Quantity</th>
          <th>Total Price</th>
          <th>Status</th>
          <th>Action</th>
          <th>Order Time</th>
        </tr>
      </thead>

      <tbody>

<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
    
ArrayList<Order> od = new Order().getData();
for(int i = 0; i <od.size(); i++) 
{

    Order obj = od.get(i);

    int food_id = obj.getFood_id();
    String food_name = "";
    PreparedStatement p =
        cn.prepareStatement(
            "SELECT food_name FROM food_items WHERE food_id=?");
    p.setInt(1, food_id);
    ResultSet r = p.executeQuery();
    if(r.next()) 
    {
        food_name = r.getString("food_name");
   
%>

<tr>
  <td>#<%=obj.getOrder_id()%></td>
  <td><%=obj.getUser_id()%></td>
  <td><%=food_name%></td>
  <td><%=obj.getQuantity()%></td>

  <td class="fw-bold text-success">
    Rs. <%=obj.getPrice() * obj.getQuantity()%>
  </td>

  <td>
    <span class="badge bg-warning text-dark">
      <%=obj.getOrder_status()%>
    </span>
  </td>

  <td>
<%
String status = obj.getOrder_status();

if ("PENDING".equalsIgnoreCase(status)) {
    Double total=obj.getPrice() * obj.getQuantity();
%>
    <form method="post" action="AcceptOrder.jsp" class="d-inline">
        <input type="hidden" name="order_id" value="<%=obj.getOrder_id()%>">
        <button class="btn btn-success btn-sm">Accept</button>
    </form>

    <form method="post" action="RejectOrder.jsp?order_id=<%=obj.getOrder_id()%>" class="d-inline">
        <input type="hidden" name="amount" value="<%=total%>">
        <button class="btn btn-danger btn-sm">Reject</button>
    </form>
<%
} else if ("ACCEPTED".equalsIgnoreCase(status)) {
%>
    <span class="badge bg-success">Accepted</span>
<%
} else if ("REJECTED".equalsIgnoreCase(status)) {
%>
    <span class="badge bg-danger">Rejected</span>
<%
}
%>
</td>


  <td class="small text-muted">
    <%=obj.getOrder_time()%>
  </td>
</tr>

<%
    }
}
%>

      </tbody>
    </table>
  </div>

</div>
