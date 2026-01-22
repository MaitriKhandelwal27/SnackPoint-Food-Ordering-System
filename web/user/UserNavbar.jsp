<%@page import="vgt.models.User"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/united/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- USER NAVBAR -->

<style>
/* ---------- NAVBAR ---------- */
.navbar {
    padding: 10px 18px;
    box-shadow: 0 4px 14px rgba(0,0,0,0.12);
}

/* Brand */
.navbar-brand {
    font-size: 20px;
    letter-spacing: 0.5px;
}

/* Welcome text */
.user-welcome {
    font-size: 14px;
    color: #fff;
}

/* Wallet badge */
.wallet-badge {
    background: #ffc107;
    color: #222;
    font-weight: 600;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 13px;
}

/* Nav links */
.navbar-nav .nav-link {
    font-size: 14px;
    margin-left: 8px;
    padding: 6px 12px;
    border-radius: 18px;
    transition: background 0.2s ease;
}

.navbar-nav .nav-link:hover {
    background: rgba(255,255,255,0.15);
}

/* Logout highlight */
.navbar-nav .nav-link.logout {
    color: #ffc107 !important;
    font-weight: 500;
}

.navbar-nav .nav-link.logout:hover {
    background: rgba(255,193,7,0.2);
}
</style>

<body><nav class="navbar navbar-expand-lg bg-primary navbar-dark">
  <div class="container-fluid">

    <!-- Brand -->
    <a class="navbar-brand fw-bold" href="UserHome.jsp">
      SnackPoint
    </a>

<%
String email = (String) request.getAttribute("email");
User u = new User();
%>
<span class="navbar-text ms-3 user-welcome">
   Welcome, <%=u.getUserName(email)%>
   <span class="wallet-badge ms-2">
     Rs. <%=u.getBalance(email)%>
   </span>
</span>

    <!-- Toggle -->
    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse"
            data-bs-target="#userNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Links -->
    <div class="collapse navbar-collapse" id="userNavbar">
      <ul class="navbar-nav ms-auto">

        <li class="nav-item">
          <a class="nav-link" href="UserHome.jsp">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="ShowWallet.jsp">Wallet</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="TransactionHistory.jsp">Transactions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="CartPage.jsp">Cart</a>
        </li>

         <li class="nav-item">
             <a class="nav-link" href="OrderHistory.jsp">Order history</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="UserProfile.jsp">Profile</a>
        </li>

        <li class="nav-item">
         <a class="nav-link logout" href="../LogOut.jsp">Logout</a>

        </li>

      </ul>
    </div>

  </div>
</nav>
