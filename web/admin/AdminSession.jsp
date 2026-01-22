<%@page import="java.sql.*" %>

<%
    String e1="",ut="";
    session=request.getSession(false);
    if(session==null)
    {
        response.sendRedirect("../author.jsp");
    }
    else
    {
        try
        {
            e1=session.getAttribute("email").toString();
            ut=session.getAttribute("usertype").toString();
            if(ut.equalsIgnoreCase("admin")==false)
            {
                response.sendRedirect("../author.jsp");
            }
        }
            catch(NullPointerException e)
            {
                response.sendRedirect("../author.jsp");
            }  
    }
%>
