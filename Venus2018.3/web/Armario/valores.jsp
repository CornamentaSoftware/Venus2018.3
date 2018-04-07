<%-- 
    Document   : valores
    Created on : 1/04/2018, 11:48:44 AM
    Author     : Marvella Ortega
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    body>
        <%@page import="java.sql.*,java.io.*" %>
        <%  
            String inter = request.getParameter("favorito");
            out.println("<script>alert('"+inter+"');</script>");
        %>
    </body>
</html>
