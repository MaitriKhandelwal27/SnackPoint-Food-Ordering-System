<%@page import="vgt.models.admin"%>
<%@page import="java.util.ArrayList"%>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%
    
   ArrayList<admin> med = new admin().getData();
    for(int i = 0; i < med.size(); i++) {
        admin obj = med.get(i);
%>
 <div class="admin-card">
        <div class="admin-info">
            <div class="admin-row">
                <span class="admin-label">Name:</span>
                <span class="admin-value"><%=obj.getName()%></span>
            </div>
            <div class="admin-row">
                <span class="admin-label">Contact:</span>
                <span class="admin-value"><%=obj.getContact()%></span>
            </div>
            <div class="admin-row">
                <span class="admin-label">Email:</span>
                <span class="admin-value"><%=obj.getEmail()%></span>
            </div>
        </div>
    </div>
<%
    }
%>