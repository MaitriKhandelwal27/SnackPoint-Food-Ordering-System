
<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp" %>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserFooter.jsp" %>
<%@include file="UserNavbar.jsp" %>

<div class="container mt-4">

  <h3 class="text-center mb-4"> Available Food Items</h3>

  <div class="row">
<style>
.add-to-cart-btn {
    border-radius: 25px;
    padding: 10px;
    font-weight: 600;
    transition: 0.3s ease-in-out;
}

.add-to-cart-btn:hover {
    background: #ff6b6b;
    border-color: #ff6b6b;
    transform: scale(1.02);
}
</style>

<%
String food_id=request.getParameter("food_id");
int fid=Integer.parseInt(food_id);
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
/* USER ID */
int user_id = 0;
PreparedStatement p =
 cn.prepareStatement("SELECT user_id FROM users WHERE email=?");
p.setString(1, e1);

ResultSet rsUser = p.executeQuery();
if(rsUser.next()) {
    user_id = rsUser.getInt("user_id");
}

/* FOOD + CART QTY */
String sql ="select * from food_category where food_id=?";

PreparedStatement p1 = cn.prepareStatement(sql);
p1.setInt(1, fid);
ResultSet r1 = p1.executeQuery();

if(r1.next()) {

    String food_name = r1.getString("food_name");
    double price = r1.getDouble("price");
    String type = r1.getString("type");
    String category_name = r1.getString("category_id");
    boolean is_available = r1.getBoolean("is_available");
    String description = r1.getString("description");
    String image = r1.getString("image");
%>

<div class="col-md-3 mb-4">
  <div class="card h-100 shadow-sm">

    <img src="../images/<%=image%>"
         class="card-img-top"
         height="180"
         alt="<%=food_name%>">

    <div class="card-body text-center">

      <h5 class="card-title"><%=food_name%></h5>

      <span class="badge bg-secondary mb-1">
        <%=category_name%>
      </span>

      <p class="mt-2 small text-muted">
        <%=description%>
      </p>

      <p class="fw-bold text-success">
        Rs. <%=price%>
      </p>

      <p class="small">
        Type: <%=type%> |
        Available:
        <%= is_available ? "Yes" : "No" %>
      </p>
      
      <form method="post" action="Cart.jsp?food_id=<%=fid%>">
    <input type="hidden" name="action" value="increase"/>

    <button class="btn btn-dark w-100 mt-2 add-to-cart-btn">
        Add to Cart
    </button>
</form>

    </div>
  </div>
</div>

<%
}

%>

  </div>
</div>

