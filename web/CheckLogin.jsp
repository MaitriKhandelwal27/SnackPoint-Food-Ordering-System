<%@page import="java.sql.*" %>
<%
     String e1=request.getParameter("email");
     String e2=request.getParameter("pass");
        Connection cn;
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath="jdbc:mysql://localhost:3306/snackers";
            String dbuser="root";
            String dbpass="maitri27";
            cn=DriverManager.getConnection(dbpath, dbuser, dbpass);
         String s1="Select * from logindata where email=? And pass=?";
         PreparedStatement p1=cn.prepareStatement(s1);
         p1.setString(1, e1);
         p1.setString(2, e2);
         ResultSet r1=p1.executeQuery();
         if(r1.next())
         { 
             
             String ut=r1.getString("usertype");
             session=request.getSession(true);
             out.print("The user type is : "+ut);
             session.setAttribute("email", e1);
             session.setAttribute("usertype", ut);
             if(ut.equalsIgnoreCase("ADMIN"))
             {
                 
                 response.sendRedirect("admin/AdminHome.jsp");
             }
             else if(ut.equalsIgnoreCase("USER"))
             {
                 response.sendRedirect("user/UserHome.jsp");
             }
             
         }
         else
         {
             response.sendRedirect("LoginError.jsp");
         }
%>