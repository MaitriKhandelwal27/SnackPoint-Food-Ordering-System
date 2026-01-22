<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 600px;">

  <h3 class="text-center mb-4">👤 Register New User</h3>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="UserReg1.jsp">

        <div class="mb-3">
          <label class="form-label">Name</label>
          <input type="text"
                 name="name"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Address</label>
          <input type="text"
                 name="address"
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
          <label class="form-label">Email</label>
          <input type="email"
                 name="email"
                 class="form-control"
                 required>
        </div>

        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password"
                 name="pass"
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
            Register User
          </button>
        </div>

      </form>

    </div>
  </div>

</div>
