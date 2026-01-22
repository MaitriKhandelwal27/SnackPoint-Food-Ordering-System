<%
    HttpSession s = request.getSession(false);
    if (s != null) {
        s.invalidate();   // DESTROY session
    }

    response.sendRedirect("LoginForm.jsp");
%>