<%-- 
    Document   : PPeticion
    Created on : 01-abr-2018, 19:29:06
    Author     : rodri
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String titulo = request.getParameter("nombre");
            String descripcion = request.getParameter("apellido");
            String etiquetas = request.getParameter("username");
            
            Connection con = null;
            Statement sta = null;
            ResultSet result;
            
            String IdUsuario = (String)session.getAttribute("IdUsuario");
            
        try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/VENUS", "root", "n0m3l0");
                sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }
                
                try {            
                        //sta.executeUpdate("insert into peticion (Id_Usuario, contenido, imagen) values('"+IdUsuario+"', '"+contenido+"', '"+objeto+"');");          
                        con.close();
                        out.println("<script>window.location.href = 'Perfil.jsp';</script>");
                    }
                 catch (SQLException error) {     
                    out.println("<script>alert('Ha ocurrido un error con tu peticion');window.location.href = 'Perfil.jsp';</script>");
                    out.println(error);
                }
                con.close();
        %>
        
        <p><%=titulo%></p>
        <p><%=descripcion%></p>
        <p><%=etiquetas%></p>
    </body>
</html>
