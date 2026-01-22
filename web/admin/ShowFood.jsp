<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vgt.models.Food"%>
<%@page import="java.util.ArrayList"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminFooter.jsp" %>
<style>
.food-card {
    font-size: 14px;
}

.food-img {
    height: 130px;
    object-fit: cover;
}

.food-title {
    font-size: 15px;
    font-weight: 600;
}

.price {
    font-size: 14px;
}
</style>

<div class="container-fluid mt-4">

  <h4 class="text-center mb-4">🍽 Food Items</h4>

  <div class="row g-3 justify-content-center">

<%
ArrayList<Food> data = Food.fetchAll();

if(data == null || data.size() == 0) {
%>
    <div class="col-12">
        <div class="alert alert-info text-center">
            No food items found.
        </div>
    </div>
<%
} else {
    for(Food f : data) {
%>

<!-- 6 cards per row on large screen -->
<div class="col-6 col-sm-4 col-md-3 col-lg-2">

  <div class="card food-card h-100 shadow-sm">

    <%
    String img = f.getImage();
    if (img != null && !img.equalsIgnoreCase("no")) {
    %>

      <img src="../images/<%= img %>"
           class="card-img-top food-img"
           alt="<%= f.getFood_name() %>">

      <div class="text-center mt-1">
        <form method="post"
              action="ChangeFoodPhoto.jsp?food_id=<%= f.getFood_id() %>"
              enctype="multipart/form-data">
          <button type="submit"
                  class="btn btn-outline-primary btn-sm w-100">
            Change Photo
          </button>
        </form>
      </div>

    <%
    } else {
    %>

      <div class="card-body p-2">
        <form method="post"
              action="UploadFoodPhoto.jsp?food_id=<%= f.getFood_id() %>"
              enctype="multipart/form-data">

          <input type="file"
                 name="photo"
                 class="form-control form-control-sm mb-2"
                 required>

          <button type="submit"
                  class="btn btn-success btn-sm w-100">
            Upload Photo
          </button>
        </form>
      </div>

    <%
    }
    %>

    <div class="card-body text-center p-2">

      <div class="food-title">
        <%= f.getFood_name() %>
      </div>

      <div>
        <strong>Type:</strong> <%= f.getType() %>
      </div>

      <div class="price text-success fw-bold">
        Rs. <%= f.getPrice() %>
      </div>

      <div class="d-flex justify-content-center gap-1 mt-2">

        <form action="UpdateFood.jsp" method="post">
          <input type="hidden" name="food_id" value="<%= f.getFood_id() %>">
          <button type="submit"
                  class="btn btn-warning btn-sm">
            Update
          </button>
        </form>

        <form action="DeleteFood.jsp"
              method="post"
              onsubmit="return confirm('Are you sure you want to delete this food?');">
          <input type="hidden" name="food_id" value="<%= f.getFood_id() %>">
          <button type="submit"
                  class="btn btn-danger btn-sm">
            Delete
          </button>
        </form>

      </div>

    </div>

  </div>
</div>

<%
    }
}
%>

  </div>
</div>
