<jsp:useBean id="st" class="vgt.models.User"></jsp:useBean>
<jsp:setProperty property="*" name="st"/>

<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%
    String msg=st.updateuser();
%>
<%=msg%>
