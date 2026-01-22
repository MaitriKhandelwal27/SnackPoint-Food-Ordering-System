<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 450px;">

  <h3 class="text-center mb-4">📂 Add Category</h3>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="CategoryReg1.jsp">

        <div class="mb-3">
          <label class="form-label">Category Name</label>
          <input type="text"
                 name="category_name"
                 class="form-control"
                 placeholder="Enter category name"
                 required>
        </div>

        <div class="d-grid">
          <button type="submit"
                  class="btn btn-primary">
            Register Category
          </button>
        </div>

      </form>

    </div>
  </div>

</div>

