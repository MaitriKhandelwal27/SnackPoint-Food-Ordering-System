<jsp:useBean id="us" class="vgt.models.User"></jsp:useBean>
<jsp:setProperty property="*" name="us"></jsp:setProperty>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%
    String msg=us.savedata();
    
%>

<%=msg%>