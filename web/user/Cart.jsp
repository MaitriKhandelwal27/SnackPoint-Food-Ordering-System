<%@page import="vgt.models.DbSettings"%>
<%@include file="UserSession.jsp" %>
<%@page import="java.sql.*"%>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserNavbar.jsp" %>
<%@include file="UserFooter.jsp" %>
<%

String food_id = request.getParameter("food_id");
int fid=Integer.parseInt(food_id);
String action = request.getParameter("action");  
DbSettings ds = new DbSettings();
Connection cn = ds.connect();

PreparedStatement psUser =cn.prepareStatement("SELECT user_id FROM users WHERE email=?");
psUser.setString(1, e1);
ResultSet rsUser = psUser.executeQuery();
if(rsUser.next())
{
   int user_id = rsUser.getInt("user_id");


PreparedStatement psCheck =cn.prepareStatement("SELECT quantity FROM cart WHERE user_id=? AND food_id=?");
psCheck.setInt(1, user_id);
psCheck.setInt(2, fid);

ResultSet rs = psCheck.executeQuery();

if(rs.next())
{
    System.out.println(user_id);
    int qty = rs.getInt("quantity");

    if(action.equals("increase"))
    {
        PreparedStatement ps =cn.prepareStatement("UPDATE cart SET quantity = quantity + 1 WHERE user_id=? AND food_id=?");
        ps.setInt(1, user_id);
        ps.setInt(2, fid);
        ps.executeUpdate();
    }
    else if(action.equals("decrease"))
    {
        if(qty > 1)
        {
            PreparedStatement ps=cn.prepareStatement("UPDATE cart SET quantity = quantity - 1 WHERE user_id=? AND food_id=?");
            ps.setInt(1, user_id);
            ps.setInt(2, fid);
            ps.executeUpdate();
        }
        else
        {
            PreparedStatement ps =cn.prepareStatement("DELETE FROM cart WHERE user_id=? AND food_id=?");
            ps.setInt(1, user_id);
            ps.setInt(2, fid);
            ps.executeUpdate();
        }
    }
}
else
{
    
    if(action.equals("increase"))
    {
        
        PreparedStatement ps =cn.prepareStatement("INSERT INTO cart(user_id, food_id, quantity) VALUES(?,?,1)");
        ps.setInt(1, user_id);
        ps.setInt(2, fid);
        ps.executeUpdate();
    }
}
}

response.sendRedirect("CartPage.jsp");

%>
