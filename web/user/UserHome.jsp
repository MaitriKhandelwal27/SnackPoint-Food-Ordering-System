<%@page import="vgt.models.DbSettings"%>
<%@page import="java.sql.*"%>
<%@include file="UserSession.jsp"%>
<%
    // expose email for navbar
    request.setAttribute("email", e1);
%>
<%@include file="UserFooter.jsp" %>

<style>
/* ---------- CATEGORY SECTION ---------- */
.category-title {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.3px;
}

.category-item {
    cursor: pointer;
    transition: transform 0.25s ease;
}

.category-item:hover {
    transform: translateY(-6px);
}

.category-img {
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 50%;
    box-shadow: 0 6px 16px rgba(0,0,0,0.12);
    transition: box-shadow 0.25s ease;
}

.category-item:hover .category-img {
    box-shadow: 0 10px 26px rgba(0,0,0,0.2);
}

.category-name {
    font-size: 14px;
    font-weight: 500;
    margin-top: 8px;
    color: #333;
}

/* ---------- SEARCH ---------- */
.search-box {
    max-width: 420px;
    margin: auto;
}

.search-box input {
    border-radius: 25px;
    padding: 10px 18px;
    border: 1px solid #ddd;
    box-shadow: 0 4px 14px rgba(0,0,0,0.06);
    transition: box-shadow 0.2s ease;
}

.search-box input:focus {
    box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    border-color: #ff5722;
}

/* ---------- FOOD GRID ---------- */
#foodArea {
    padding: 0 10px;
}
</style>

<script>
let selectedCategory = 0; // 0 = all
let searchKey = "";

window.onload = function () {
    loadFood();
};

function loadFood() {
    console.log("loadFood",selectedCategory)
    fetch("SearchFood.jsp?key=" + searchKey + "&cid=" + selectedCategory)
    .then(res => res.text())
    .then(data => document.getElementById("foodArea").innerHTML = data);
}

function searchFood(val) {
    searchKey = val;
    loadFood();
}

function filterCategory(cid) {
    console.log(cid);
    selectedCategory = cid;
    searchKey = "";
    document.getElementById("searchBox").value = "";
    loadFood();
}
</script>
</head>

<%@include file="UserNavbar.jsp"%>

<div class="container mt-4">
  <h5 class="text-center mb-4 category-title">Categories</h5>

  <div class="row justify-content-center text-center">

<%
DbSettings ds=new DbSettings();
Connection cn=ds.connect();
String sql="SELECT * FROM categories";
PreparedStatement p=cn.prepareStatement(sql);
ResultSet rs=p.executeQuery();
while(rs.next()) 
{   
    int category_id=rs.getInt("category_id");
    String sql1="select image from food_items where category_id=?";
    PreparedStatement p1=cn.prepareStatement(sql1);
    p1.setInt(1,category_id);
    ResultSet rs1=p1.executeQuery();
    if(rs1.next())
    {
%>
  <div class="col-md-2 col-sm-4 col-6 mb-4 text-center category-item"
     onclick="filterCategory(<%=rs.getInt("category_id")%>)">

    <img src="../images/<%=rs1.getString("image")%>"
         class="category-img">

    <p class="category-name">
        <%=rs.getString("category_name")%>
    </p>
</div>

<%
    }
}
%>

  </div>
</div>

<!-- SEARCH -->
<div class="container mt-4 search-box">
  <input type="text"
         id="searchBox"
         class="form-control"
         placeholder="Search for dishes..."
         onkeyup="searchFood(this.value)">
</div>


<!-- FOOD AREA -->
<div class="container-fluid mt-4">
  <div class="row g-3 justify-content-center" id="foodArea">
    <!-- FOOD COMES FROM SearchFood.jsp -->
  </div>
</div>