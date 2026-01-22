<%@include file="UserSession.jsp" %>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="vgt.models.DbSettings"%>
<style>
table {
    border-radius: 12px;
    overflow: hidden;
}

.badge {
    padding: 6px 12px;
    font-size: 0.85rem;
}

h4 {
    font-weight: 600;
}
</style>

<%

    
DbSettings ds=new DbSettings();
Connection cn=ds.connect();

int user_id = 0;
String s="SELECT * FROM users where email=?";
PreparedStatement pp = cn.prepareStatement(s);
pp.setString(1,e1);
ResultSet rsUser = pp.executeQuery();

if(rsUser.next()) 
{
    user_id = rsUser.getInt("user_id");

String sql="select * from transactions where user_id=?";
PreparedStatement p=cn.prepareStatement(sql);
p.setInt(1,user_id);
ResultSet rs=p.executeQuery();

%>
<div class="container mt-4">
  <h4 class="text-center mb-4">Transaction History</h4>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle text-center shadow-sm">

      <thead class="table-dark">
        <tr>
          <th>Transaction ID</th>
          <th>Amount (Rs.)</th>
          <th>Type</th>
          <th>Date & Time</th>
        </tr>
      </thead>

<%
while(rs.next())
{
    int tid=rs.getInt("tid");
    Double amt=rs.getDouble("amt");
    String trans_type=rs.getString("trans_type");
    Timestamp trans_date=rs.getTimestamp("trans_date");
    
%>


      <tbody>
        <tr>
          <td><%=tid%></td>

          <td class="fw-bold 
              <%= trans_type.equalsIgnoreCase("debit") ? "text-danger" : "text-success" %>">
            Rs. <%=amt%>
          </td>

          <td>
            <span class="badge 
              <%= trans_type.equalsIgnoreCase("debit") ? "bg-danger" : "bg-success" %>">
              <%=trans_type%>
            </span>
          </td>

          <td><%=trans_date%></td>
        </tr>

<%
}
}
%>
      </tbody>
</table>
    
  </div>
</div>
<%@include file="UserFooter.jsp" %>