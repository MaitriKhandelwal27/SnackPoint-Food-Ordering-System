<jsp:useBean id="food" class="vgt.models.Food"/>
<jsp:setProperty property="*" name="food"/>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%
    String msg=food.UpdateFood();
%>