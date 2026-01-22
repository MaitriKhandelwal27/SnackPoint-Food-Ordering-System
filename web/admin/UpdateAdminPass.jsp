<%@include file="AdminFooter.jsp" %>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>

<div class="container d-flex justify-content-center mt-5">
    <div class="card shadow-lg p-4" style="width: 380px; border-radius: 12px;">
        <h4 class="text-center mb-3 fw-bold">Change Password</h4>
        <hr>

        <form method="post" action="UpdateAdminPass1.jsp">

            <div class="mb-3">
                <label class="form-label fw-semibold">Old Password</label>
                <input type="text" class="form-control" name="opass" placeholder="Enter old password">
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">New Password</label>
                <input type="text" class="form-control" name="npass" placeholder="Enter new password">
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Confirm Password</label>
                <input type="text" class="form-control" name="cpass" placeholder="Confirm new password">
            </div>

            <button type="submit" class="btn btn-primary w-100 mt-2">
                Change Password
            </button>

        </form>
    </div>
</div>
