<%@page import="vgt.models.Food"%>
<%@ page import="java.io.*, java.sql.*" %>
<%@include file="AdminSession.jsp" %>
<%@include file="AdminNavbar.jsp" %>
<%@include file="AdminFooter.jsp" %>
<style>
.upload-card {
    max-width: 420px;
    margin: 60px auto;
}

.upload-card h5 {
    font-weight: 600;
}

</style>

<%
request.setCharacterEncoding("UTF-8");
String food_id=request.getParameter("food_id");
System.out.println("Food id : "+food_id);
String uploadedFileName="", saveFileName="", msg="";

String contentType = request.getContentType();

if (contentType != null && contentType.contains("multipart/form-data")) {

    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte[] dataBytes = new byte[formDataLength];

    int totalBytesRead = 0, bytesRead;
    while (totalBytesRead < formDataLength) {
        bytesRead = in.read(dataBytes, totalBytesRead, formDataLength - totalBytesRead);
        totalBytesRead += bytesRead;
    }

    String dataStr = new String(dataBytes, "ISO-8859-1");
    String boundary = contentType.substring(contentType.lastIndexOf("=") + 1);

    int fileNameStart = dataStr.indexOf("filename=\"") + 10;
    int fileNameEnd = dataStr.indexOf("\"", fileNameStart);

    uploadedFileName = dataStr.substring(fileNameStart, fileNameEnd);
    uploadedFileName = uploadedFileName.substring(uploadedFileName.lastIndexOf("\\") + 1);
    uploadedFileName = uploadedFileName.trim().replaceAll("[^a-zA-Z0-9._-]", "_");

    int fileStartPos = dataStr.indexOf("\r\n\r\n", fileNameEnd) + 4;
    int fileEndPos = dataStr.indexOf(boundary, fileStartPos) - 4;

    int startByte = dataStr.substring(0, fileStartPos).getBytes("ISO-8859-1").length;
    int endByte   = dataStr.substring(0, fileEndPos).getBytes("ISO-8859-1").length;

    saveFileName = System.currentTimeMillis()+ "_" + uploadedFileName;
    String uploadPath = application.getRealPath("/images") + File.separator + saveFileName;

    try (FileOutputStream fos = new FileOutputStream(uploadPath)) {
        fos.write(dataBytes, startByte, (endByte - startByte));
    }
    
    int ans=new Food().updateImage(saveFileName, Integer.parseInt(food_id));
    if(ans>0){
        msg="Image updated successfully!";
    }
    else {
        msg="Error: Cannot update image in database";
    }
} else {
    msg = "Form must use enctype='multipart/form-data'";
}
%>

<div class="container">
    <div class="card upload-card shadow-sm text-center">
        <div class="card-body">

            <h5 class="mb-3">Upload Food Image</h5>

            <div class="alert 
                <%= msg.toLowerCase().contains("success") ? "alert-success" : "alert-danger" %>">
                <%= msg %>
            </div>

            <a href="ShowFood.jsp" class="btn btn-primary btn-sm">
                 Back to Food List
            </a>

        </div>
    </div>
</div>
