<%@page import="vgt.models.DbSettings"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 600px;">

  <h3 class="text-center mb-4">✏️ Update Food</h3>

<%
int food_id = Integer.parseInt(request.getParameter("food_id"));
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
String s1 = "SELECT * FROM food_items WHERE food_id=?";
PreparedStatement p1 = cn.prepareStatement(s1);
p1.setInt(1, food_id);
ResultSet r1 = p1.executeQuery();

if(r1.next()) {

    String name = r1.getString("food_name");
    String price = r1.getString("price");
    String type = r1.getString("type");
    String is_available = r1.getString("is_available");
    String des = r1.getString("description");
%>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="UpdateFood1.jsp">

        <input type="hidden" name="food_id" value="<%=food_id%>">

        <div class="mb-3">
          <label class="form-label">Food Name</label>
          <input type="text"
                 name="food_name"
                 value="<%=name%>"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Price (Rs.)</label>
          <input type="number" name="price" value="<%=price%>" class="form-control" required>
        </div>

        <div class="mb-3">
          <label class="form-label">Type</label>
          <select name="type" class="form-select" required>
            <option value="Veg" <%= "Veg".equals(type) ? "selected" : "" %>>Veg</option>
            <option value="Non-Veg" <%= "Non-Veg".equals(type) ? "selected" : "" %>>Non-Veg</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Available</label>
          <select name="is_available" class="form-select" required>
            <option value="1" <%= "1".equals(is_available) ? "selected" : "" %>>Yes</option>
            <option value="0" <%= "0".equals(is_available) ? "selected" : "" %>>No</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Description</label>
          <textarea name="description"
                    class="form-control"
                    rows="3"
                    required><%=des%></textarea>
        </div>

        <div class="d-grid">
          <button type="submit"
                  class="btn btn-primary">
            Update Food
          </button>
        </div>

      </form>

    </div>
  </div>

<%
}
cn.close();
%>

</div>
