<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp"%>
<style>
/* Card container */
.card {
    border: none;
    border-radius: 14px;
    overflow: hidden;
    background: #fff;
    transition: all 0.25s ease;
    box-shadow: 0 6px 16px rgba(0,0,0,0.08);
}

.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 28px rgba(0,0,0,0.15);
}

/* Image */
.card-img-top {
    height: 120px;
    object-fit: cover;
}

/* Body */
.card-body {
    padding: 10px 12px;
    text-align: center;
}

/* Food name */
.card h5 {
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 4px;
    color: #222;
}

/* Price */
.card p {
    font-size: 14px;
    font-weight: 500;
    color: #ff5722;
    margin-bottom: 10px;
}

/* Button */
.card .btn {
    font-size: 14px;
    padding: 6px 0;
    border-radius: 20px;
    background: #ff5722;
    border: none;
    transition: background 0.2s ease;
}

.card .btn:hover {
    background: #e64a19;
}
</style>


<%
String key = request.getParameter("key");
String cid=request.getParameter("cid");
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
String sql="select * from food_items";
if(key.equals("") || key==null)
{
    if(cid.equals("0") || cid==null)
    {
        sql = "select * from food_items";
    }
    else if(cid!=null)
    {
     sql= "select * from food_items where category_id="+cid;
    }
}
else if(key!=null)
{
    if(cid.equals("0") || cid==null)
    {
    sql = "select * from food_items where food_name like '%" + key + "%'";

    }
    else if(cid!=null)
    {
     sql= "select * from food_items where category_id="+cid+" and food_name like  '%" + key + "%'";
    }
}
PreparedStatement ps=cn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()) {
%>

<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6 mb-4">
  <div class="card h-100">
    <img src="../images/<%= rs.getString("image")%>" class="card-img-top">
    <div class="card-body">
      <h5><%=rs.getString("food_name")%></h5>
      <p>Rs. <%=rs.getInt("price")%></p>

      <form method="post"
            action="ShowFoodUser.jsp?food_id=<%=rs.getInt("food_id")%>">
        <button type="submit" class="btn w-100">
          Read More
        </button>
      </form>
    </div>
  </div>
</div>


<%
}
%>
