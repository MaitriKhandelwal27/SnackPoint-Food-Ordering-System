<%@page import="vgt.models.Food"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%
String food_id = request.getParameter("food_id");
int fid = Integer.parseInt(food_id);

String fileName = null;
ArrayList<Food> list = Food.fetchAll();

for (Food f : list) 
{
    if (f.getFood_id() == fid) 
    {
        fileName = f.getImage();
        break;
    }
}

if (fileName != null && !fileName.equals("no")) {
    String uploadPath = application.getRealPath("/images");
    File file = new File(uploadPath + File.separator + fileName);
    if (file.exists()) {
        file.delete();
    }
}

new Food().updateImage("no", fid);

response.sendRedirect("ShowFood.jsp");
%>
