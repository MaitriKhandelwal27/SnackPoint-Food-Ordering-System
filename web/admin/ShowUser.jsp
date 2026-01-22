<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vgt.models.User"%>
<%@page import="java.util.ArrayList"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5">

  <h3 class="text-center mb-4">👥 User List</h3>

  <div class="row">

<%
ArrayList<User> data = User.fetchAll();
    for(User st : data) {

        int user_id=st.getUser_id();
        String name = st.getName();
        String contact = st.getContact();
        String email = st.getEmail();
        Double balance=st.getBalance();
        Timestamp created_at=st.getCreated_at();
%>

<div class="col-md-4 mb-4">
  <div class="card shadow-sm h-100">

    <div class="card-header bg-primary text-white text-center">
      User Details
    </div>

    <div class="card-body">
      <h5 class="card-title text-center">
        <%=name%>
      </h5>

      <p class="mb-1">
        <strong>Contact:</strong> <%=contact%>
      </p>

      <p class="mb-2">
        <strong>Email:</strong> <%=email%>
      </p>
        
      
      <p class="mb-2">
        <strong>Balance</strong> <%=balance%>
      </p>
      
      <p class="mb-2">
        <strong>created_at</strong> <%=created_at%>
      </p>
      <div class="d-grid gap-2 mt-3">

        <!-- UPDATE USER -->
        <form method="post" action="UpdateUser.jsp">
          <input type="hidden" name="email" value="<%=email%>">
          <button type="submit" class="btn btn-warning btn-sm">
            Update User
          </button>
        </form>

        <!-- DELETE USER -->
        <form method="post"
              action="DeleteUser.jsp"
              onsubmit="return confirm('Are you sure you want to delete this user?');">
          <input type="hidden" name="email" value="<%=email%>">
          <button type="submit" class="btn btn-danger btn-sm">
            Delete User
          </button>
        </form>

        <form method="post" action="Wallet.jsp">
          <input type="hidden" name="user_id" value="<%=user_id%>">
          <button type="submit" class="btn btn-success btn-sm">
            Wallet
          </button>
        </form>

      </div>
    </div>

  </div>
</div>

<%

}
%>

  </div>
</div>
