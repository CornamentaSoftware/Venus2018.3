<%-- 
    Document   : alta
    Created on : 29-oct-2017, 13:42:02
    Author     : rodri
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GuardarPrenda</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>
        <%  
            Connection con = null;
            Statement sta = null;
            
            String Talla = "";
            String TipoPrenda = ""; 
            int TipoPrendaInt = 0;
            int TallaInt = 0;
            String Precio = "";
            String Descripcion = "";
            String Intercambiable = "";
            String Favorito = "";
            String Usuario = session.getAttribute("usuario").toString();
            
                String rutalocal=getServletContext().getRealPath("/");
                String rutacarp=rutalocal+"Uploads/Prendas";
                String nruta=rutacarp.replace("\\","/");
                String ruta=nruta.replaceAll("/build",""); 
                String objeto = "";
                
                File destino = new File(ruta);
               
		ServletRequestContext src = new ServletRequestContext(request);
 
		if(ServletFileUpload.isMultipartContent(src)){
			DiskFileItemFactory factory = new DiskFileItemFactory((1024*1024),destino);
			ServletFileUpload upload = new  ServletFileUpload(factory);
 
			java.util.List lista = upload.parseRequest(src);
			File file = null;
			java.util.Iterator it = lista.iterator();
                        
			while(it.hasNext()){
				FileItem item=(FileItem)it.next();
				if(item.isFormField()){                                       
                                        if (item.getFieldName().equals("talla")){
                                            Talla = item.getString();
                                            TallaInt=Integer.parseInt(Talla);
                                        }
                                        if (item.getFieldName().equals("tipoPrenda")){
                                            TipoPrenda = item.getString();
                                            TipoPrendaInt=Integer.parseInt(TipoPrenda);
                                            if(TipoPrenda.equals("11")){
                                                if (item.getFieldName().equals("Otro"))
                                                TipoPrenda = item.getString(); 
                                            }
                                        }
                                        if (item.getFieldName().equals("precio"))
                                            Precio = item.getString();
                                        if (item.getFieldName().equals("descripcion"))
                                            Descripcion = item.getString();
                                        if (item.getFieldName().equals("i"))
                                            Intercambiable = item.getString();
                                        if (item.getFieldName().equals("f"))
                                            Favorito = item.getString();
                                }
				else
				{
					file=new File(item.getName());
					item.write(new File(destino,file.getName()));
                                        objeto = ("Uploads/Prendas/" + item.getName());
				} // end if
			} // end while
                }
                
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/VENUS", "root", "n0m3l0");
                sta = con.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }
            
            try {
                sta.executeUpdate("call nuevaPrenda('"+Usuario+"','"+TipoPrendaInt+"','"+TallaInt+"','"+objeto+"','"+Descripcion+"','"+Precio+"','"+Favorito+"','"+Intercambiable+"');");
                con.close();
                out.println("<script>alert('Prenda registada exitosamente');window.location.href = 'Armario.jsp';'</script>");
                response.sendRedirect("Armario.jsp");

            } catch (SQLException error) {     
                out.print(error.toString());
            }
            con.close();
        %>
    </body>
</html>
