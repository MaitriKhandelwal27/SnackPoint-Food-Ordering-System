<%@page import="vgt.models.DbSettings"%>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
    
    String sql="select * from admin where email=?";
    PreparedStatement p=cn.prepareStatement(sql);
    p.setString(1,e1);
    
    ResultSet rs=p.executeQuery();
    if(rs.next())
    {
        String name=rs.getString("name");
        String contact=rs.getString("contact");
       
    
%>

<div class="container d-flex justify-content-center mt-5">
    <div class="card shadow-lg p-4" style="width: 350px; border-radius: 12px;">
        <div class="text-center mb-3">
            <h4 class="fw-bold">Admin Profile</h4>
            <hr>
        </div>

        <div class="mb-2">
            <strong>Name:</strong> <span class="ms-2"><%= name %></span>
        </div>

        <div class="mb-2">
            <strong>Contact:</strong> <span class="ms-2"><%= contact %></span>
        </div>

        <div class="mb-3">
            <strong>Email:</strong> <span class="ms-2"><%= e1 %></span>
        </div>

        <form method="post" action="UpdateAdminPass.jsp" class="text-center">
            <button class="btn btn-primary w-100">
                Update Password
            </button>
        </form>
    </div>
</div>

<%
    }
%>