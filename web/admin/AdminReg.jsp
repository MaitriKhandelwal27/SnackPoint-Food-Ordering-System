<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 500px;">

  <h3 class="text-center mb-4">👨‍💼 Admin Registration</h3>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="SaveAdmin.jsp">

        <div class="mb-3">
          <label class="form-label">Name</label>
          <input type="text"
                 name="name"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email"
                 name="email"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Contact</label>
          <input type="text"
                 name="contact"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password"
                 name="password"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Confirm Password</label>
          <input type="password"
                 name="confirm"
                 class="form-control"
                 required>
        </div>

        <div class="d-grid">
          <button type="submit"
                  class="btn btn-primary">
            Register Admin
          </button>
        </div>

      </form>

    </div>
  </div>

</div>

