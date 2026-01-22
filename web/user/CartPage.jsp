<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp" %>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@include file="UserFooter.jsp" %>
<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
int user_id = 0;
PreparedStatement psUser = cn.prepareStatement(
        "SELECT user_id FROM users WHERE email=?");
psUser.setString(1, e1);
ResultSet rsUser = psUser.executeQuery();
if(rsUser.next()) {
    user_id = rsUser.getInt("user_id");
}

String sql =
"SELECT c.food_id, f.food_name, f.price, c.quantity, " +
"(f.price * c.quantity) AS subtotal " +
"FROM cart c " +
"JOIN food_items f ON c.food_id = f.food_id " +
"WHERE c.user_id = ?";

PreparedStatement ps = cn.prepareStatement(sql);
ps.setInt(1, user_id);
ResultSet rs = ps.executeQuery();

double total = 0;
boolean hasItems = false;
%>

<div class="container mt-5">

  <h2 class="text-center mb-4"> My Cart</h2>

  <%
  if(!rs.isBeforeFirst()) {
  %>
      <div class="alert alert-warning text-center">
          Your cart is empty.
      </div>
  <%
  } else {
  %>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center">
      <thead class="table-primary">
        <tr>
          <th>Food Name</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Subtotal</th>
        </tr>
      </thead>

      <tbody>

<%
while(rs.next()) {
    hasItems = true;

    int food_id = rs.getInt("food_id");
    String food_name = rs.getString("food_name");
    double price = rs.getDouble("price");
    int qty = rs.getInt("quantity");
    double subtotal = rs.getDouble("subtotal");

    total += subtotal;
%>

<tr>
  <td class="fw-semibold"><%=food_name%></td>

  <td>Rs. <%=price%></td>

  <td>
    <form method="post" action="Cart.jsp" class="d-inline">

      <input type="hidden" name="food_id" value="<%=food_id%>">
      <input type="hidden" name="returnPage" value="CartPage.jsp">

      <button type="submit" name="action" value="decrease"
              class="btn btn-danger btn-sm">-</button>

      <span class="mx-2 fw-bold"><%=qty%></span>

      <button type="submit" name="action" value="increase"
              class="btn btn-success btn-sm">+</button>
    </form>
  </td>

  <td class="fw-bold text-success">
      Rs. <%=subtotal%>
  </td>
</tr>

<%
}
%>

      </tbody>
    </table>
  </div>

  <!-- TOTAL  PLACE ORDER -->
  <div class="row mt-4">
    <div class="col-md-6 offset-md-6 text-end">
      <h4>
        Total Amount :
        <span class="text-success">Rs. <%=total%></span>
      </h4>

      <form action="PlaceOrder.jsp" method="post">
        <button type="submit"
                class="btn btn-lg btn-primary mt-2">
          Place Order
        </button>
      </form>
    </div>
  </div>

  <%
  }
  %>

</div>


