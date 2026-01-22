<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5" style="max-width: 600px;">

  <h3 class="text-center mb-4">🍔 Add Food Item</h3>

  <div class="card shadow-sm">
    <div class="card-body">

      <form method="post" action="FoodReg1.jsp">

        <!-- FOOD NAME -->
        <div class="mb-3">
          <label class="form-label">Food Name</label>
          <input type="text"
                 name="food_name"
                 class="form-control"
                 required>
        </div>

        <!-- PRICE -->
        <div class="mb-3">
          <label class="form-label">Price (Rs.)</label>
          <input type="number"
                 name="price"
                 class="form-control"
                 min="1"
                 required>
        </div>

        <!-- CATEGORY ID -->
        <div class="mb-3">
          <label class="form-label">Category ID</label>
          <input type="number"
                 name="category_id"
                 class="form-control"
                 required>
        </div>

        <!-- AVAILABILITY -->
        <div class="mb-3">
          <label class="form-label">Available</label>
          <select name="is_available" class="form-select" required>
            <option value="">-- Select --</option>
            <option value="1">Yes</option>
            <option value="0">No</option>
          </select>
        </div>

        <!-- DESCRIPTION -->
        <div class="mb-3">
          <label class="form-label">Description</label>
          <textarea name="description"
                    class="form-control"
                    rows="3"
                    required></textarea>
        </div>

        <!-- TYPE -->
        <div class="mb-3">
          <label class="form-label">Food Type</label><br>

          <div class="form-check form-check-inline">
            <input class="form-check-input"
                   type="radio"
                   name="type"
                   value="Veg"
                   required>
            <label class="form-check-label">Veg</label>
          </div>

          <div class="form-check form-check-inline">
            <input class="form-check-input"
                   type="radio"
                   name="type"
                   value="Non-Veg"
                   required>
            <label class="form-check-label">Non-Veg</label>
          </div>
        </div>

        <!-- SUBMIT -->
        <div class="d-grid">
          <button type="submit"
                  class="btn btn-primary">
            Add Food
          </button>
        </div>

      </form>

    </div>
  </div>

</div>

