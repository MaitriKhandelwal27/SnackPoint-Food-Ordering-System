<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%
 DbSettings ds=new DbSettings();
Connection cn=ds.connect();
    String uid=request.getParameter("user_id");
    int user_id=Integer.parseInt(uid);
    String b=request.getParameter("balance");
    int balance=Integer.parseInt(b);
String sql ="UPDATE users SET balance = COALESCE(balance,0) + ? WHERE user_id = ?";
String sql1 = "INSERT INTO transactions (user_id, amt, trans_type) VALUES (?,?,?)";

        
    PreparedStatement p = cn.prepareStatement(sql);
PreparedStatement p1 = cn.prepareStatement(sql1);

p.setDouble(1, balance);
p.setInt(2, user_id);

p1.setInt(1, user_id);
p1.setDouble(2, balance);
p1.setString(3, "deposit");


cn.setAutoCommit(false);   // start transaction

int a = p.executeUpdate();
int c = p1.executeUpdate();

if (a == 1 && c == 1) {
    cn.commit();
    %>
      <div class="alert alert-success text-center">
        Balance added successfully.
      </div>
<%
} else 
{
    cn.rollback();
    
%>
      <div class="alert alert-danger text-center">
        Failed to add balance.
      </div>
<%
}
%>


    