
<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp" %>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserFooter.jsp" %>
<%@include file="UserNavbar.jsp" %>

<div class="container mt-5">

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

double total = 0;
PreparedStatement psTotal =
    cn.prepareStatement(
        "SELECT IFNULL(SUM(f.price * c.quantity), 0) " +
        "FROM cart c JOIN food_items f " +
        "ON c.food_id = f.food_id " +
        "WHERE c.user_id=?"
    );
psTotal.setInt(1, user_id);
ResultSet rsTotal = psTotal.executeQuery();
if(rsTotal.next()) {
    total = rsTotal.getDouble(1);
}

/* ---------- WALLET CHECK ---------- */
double balance = 0;
PreparedStatement psWallet =
        cn.prepareStatement("SELECT balance FROM users WHERE user_id=?");
psWallet.setInt(1, user_id);
ResultSet rsWallet = psWallet.executeQuery();
if(rsWallet.next()) 
{
    balance = rsWallet.getDouble("balance");
}

if(balance < total) 
{
%>
    <div class="alert alert-danger text-center">
        <h4 class="mb-2">Insufficient Wallet Balance</h4>
        <p>Your wallet balance is not enough to place this order.</p>

        <a href="CartPage.jsp" class="btn btn-warning mt-2">
            Back to Cart
        </a>
    </div>
</div>
<%
    return;
}

/* ---------- INSERT INTO ORDERS ---------- */
PreparedStatement psOrder =
        cn.prepareStatement(
            "INSERT INTO orders(user_id, food_id, quantity, price, order_status) " +
            "SELECT ?, c.food_id, c.quantity, f.price, 'PENDING' " +
            "FROM cart c JOIN food_items f " +
            "ON c.food_id = f.food_id " +
            "WHERE c.user_id=?"
        );
psOrder.setInt(1, user_id);
psOrder.setInt(2, user_id);
psOrder.executeUpdate();

/* ---------- DEDUCT WALLET ---------- */
PreparedStatement psDeduct =
        cn.prepareStatement(
            "UPDATE users SET balance = balance - ? WHERE user_id=?"
        );
psDeduct.setDouble(1, total);
psDeduct.setInt(2, user_id);
psDeduct.executeUpdate();

/* ---------- CLEAR CART ---------- */
PreparedStatement psClear =
        cn.prepareStatement("DELETE FROM cart WHERE user_id=?");
psClear.setInt(1, user_id);
psClear.executeUpdate();

String txnSql = "INSERT INTO transactions VALUES(?, ?, ?, ?, NOW())";

    PreparedStatement pst = cn.prepareStatement(txnSql);
    pst.setString(1, "0");
    pst.setInt(2, user_id);
    pst.setDouble(3, total);
    pst.setString(4, "DEBIT");

    pst.executeUpdate();
%>

<!-- SUCCESS UI -->
<div class="card border-success text-center">
  <div class="card-header bg-success text-white">
    Order Placed Successfully
  </div>

  <div class="card-body">
    <h5 class="card-title">Thank you for your order!</h5>
    <p class="card-text">
        Amount Paid: <b>Rs. <%=total%></b>
    </p>

    <a href="OrderHistory.jsp" class="btn btn-primary">
        View Order History
    </a>

    <a href="UserHome.jsp" class="btn btn-outline-secondary ms-2">
        Continue Shopping
    </a>
  </div>
</div>

