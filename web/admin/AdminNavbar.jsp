<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/united/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* ---------- ADMIN NAVBAR ---------- */
.admin-navbar {
    padding: 10px 20px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.25);
}

/* Brand */
.admin-navbar .navbar-brand {
    font-size: 20px;
    letter-spacing: 0.6px;
}

/* Nav links */
.admin-navbar .nav-link {
    font-size: 14px;
    margin-left: 6px;
    padding: 6px 14px;
    border-radius: 18px;
    transition: background 0.2s ease;
}

.admin-navbar .nav-link:hover {
    background: rgba(255,255,255,0.12);
}

/* Dropdown */
.admin-navbar .dropdown-menu {
    border-radius: 12px;
    border: none;
    box-shadow: 0 8px 24px rgba(0,0,0,0.25);
    padding: 8px;
}

.admin-navbar .dropdown-item {
    font-size: 14px;
    border-radius: 8px;
    padding: 8px 12px;
    transition: background 0.2s ease;
}

.admin-navbar .dropdown-item:hover {
    background: #f2f2f2;
}

/* Logout */
.admin-navbar .logout {
    color: #ffc107 !important;
    font-weight: 500;
}

.admin-navbar .logout:hover {
    background: rgba(255,193,7,0.2);
}
</style>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark admin-navbar">
  <div class="container-fluid">

    <!-- Brand -->
    <a class="navbar-brand fw-bold" href="AdminHome.jsp">
      SnackPoint
    </a>

    <!-- Toggle -->
    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse"
            data-bs-target="#adminNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Links -->
    <div class="collapse navbar-collapse" id="adminNavbar">
      <ul class="navbar-nav ms-auto align-items-center">

        <li class="nav-item">
          <a class="nav-link" href="AdminHome.jsp">Orders</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="TransactionHistoryAll.jsp">Transactions</a>
        </li>

        <!-- STUDENT -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
            Student
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="UserReg.jsp">Add Student</a></li>
            <li><a class="dropdown-item" href="ShowUser.jsp">Show Student</a></li>
          </ul>
        </li>

        <!-- FOOD -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
            Food
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="FoodReg.jsp">Add Food</a></li>
            <li><a class="dropdown-item" href="ShowFood.jsp">Show Food</a></li>
          </ul>
        </li>

        <!-- CATEGORY -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
            Category
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="CategoryReg.jsp">Add Category</a></li>
            <li><a class="dropdown-item" href="ShowCategory.jsp">Show Category</a></li>
          </ul>
        </li>

        <!-- PROFILE -->
        <li class="nav-item">
          <a class="nav-link" href="AdminProfile.jsp">Profile</a>
        </li>

        <!-- LOGOUT -->
        <li class="nav-item">
          <a class="nav-link logout" href="../LogOut.jsp">Logout</a>
        </li>

      </ul>
    </div>
  </div>
</nav>
