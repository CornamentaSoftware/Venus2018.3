<%-- 
    Document   : GuardarIntereses
    Created on : 02-abr-2018, 22:28:23
    Author     : rodri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            Connection con = null;
            Statement sta = null;
            ResultSet result;
            
        try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/VENUS", "root", "n0m3l0");
                sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }
                
                try {            
                        // sta.executeUpdate("insert into publicacion (Id_Usuario, contenido, imagen) values('"+IdUsuario+"', '"+contenido+"', '"+objeto+"');");          
                        con.close();
                        out.println("<script>window.location.href = 'Intereses.html';</script>");
                }
                 catch (SQLException error) {     
                    out.println("<script>alert('Ha ocurrido un error con tu publicacion');window.location.href = 'Intereses.html';</script>");
                    out.println(error);
                }
                con.close();
            %>
    </body>
</html>
