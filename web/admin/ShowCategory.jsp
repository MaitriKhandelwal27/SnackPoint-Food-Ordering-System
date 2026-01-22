<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vgt.models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminFooter.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container mt-5">

  <h3 class="text-center mb-4">📂 Category List</h3>

  <div class="row">

<%
ArrayList<Category> med = new Category().getData();

if(med == null || med.size() == 0) {
%>
    <div class="col-12">
      <div class="alert alert-info text-center">
        No categories found.
      </div>
    </div>
<%
} else {
    for(int i = 0; i < med.size(); i++) {
        Category obj = med.get(i);
%>

<div class="col-md-4 mb-4">
  <div class="card shadow-sm h-100">

    <div class="card-header bg-primary text-white text-center">
      Category Details
    </div>

    <div class="card-body text-center">
      <p>
        <strong>Category ID:</strong><br>
        <span class="badge bg-secondary">
          <%=obj.getCategory_id()%>
        </span>
      </p>

      <p class="mt-2">
        <strong>Category Name:</strong><br>
        <%=obj.getCategory_name()%>
      </p>
    </div>

  </div>
</div>

<%
    }
}
%>

  </div>
</div>
