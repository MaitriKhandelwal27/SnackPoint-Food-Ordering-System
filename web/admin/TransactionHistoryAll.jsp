<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>
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

h3 {
    font-weight: 600;
}
</style>

<%
DbSettings ds = new DbSettings();
Connection cn = ds.connect();

PreparedStatement psUser =
        cn.prepareStatement("SELECT * FROM users");
ResultSet rsUser = psUser.executeQuery();
%>

<div class="container mt-4">
    <h3 class="text-center mb-4">💳 All Users Transaction History</h3>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center shadow-sm">

            <thead class="table-dark">
                <tr>
                    <th>User ID</th>
                    <th>Transaction ID</th>
                    <th>Amount (₹)</th>
                    <th>Transaction Type</th>
                    <th>Date & Time</th>
                </tr>
            </thead>

            <tbody>
            <%
            while (rsUser.next()) {
                int user_id = rsUser.getInt("user_id");

                String sql = "select * from transactions where user_id=?";
                PreparedStatement p = cn.prepareStatement(sql);
                p.setInt(1, user_id);
                ResultSet rs = p.executeQuery();

                while (rs.next()) {
                    int tid = rs.getInt("tid");
                    double amt = rs.getDouble("amt");
                    String trans_type = rs.getString("trans_type");
                    Timestamp trans_date = rs.getTimestamp("trans_date");
            %>

                <tr>
                    <td><%= user_id %></td>
                    <td><%= tid %></td>

                    <td class="fw-bold 
                        <%= trans_type.equalsIgnoreCase("debit") ? "text-danger" : "text-success" %>">
                        ₹ <%= amt %>
                    </td>

                    <td>
                        <span class="badge 
                            <%= trans_type.equalsIgnoreCase("debit") ? "bg-danger" : "bg-success" %>">
                            <%= trans_type %>
                        </span>
                    </td>

                    <td><%= trans_date %></td>
                </tr>

            <%
                }
            }
            %>
            </tbody>
        </table>
    </div>
</div>

<%@include file="AdminFooter.jsp" %>
