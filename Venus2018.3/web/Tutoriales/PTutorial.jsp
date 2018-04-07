<%-- 
    Document   : PTutorial
    Created on : 02-abr-2018, 22:44:30
    Author     : rodri
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="servlets.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Encriptacion.AES"%>
<%@page import="java.util.Set"%>
<%@page import="servlets.LoginServlet"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
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
            
            String materiales[] = {""};
            int cantMateriales = 0;
            String titulo="";
            String IdUsuario = (String)session.getAttribute("IdUsuario");
            String descripcion = "";
            String material1 = "";
            int x =1;
            
            
            String objeto ="";
            
            String imagenvalid = "";
                    try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/VENUS", "root", "n0m3l0");
                sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }
                    
                    String rutalocal=getServletContext().getRealPath("/");
                    String rutacarp=rutalocal+"Uploads/Tutorial";
                    String nruta=rutacarp.replace("\\","/");
                    String ruta=nruta.replaceAll("/build",""); 

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
                                            if (item.getFieldName().equals("nombre"))
                                                titulo = item.getString();
                                            if (item.getFieldName().equals("apellido"))
                                                descripcion = item.getString();
                                            if (item.getFieldName().equals("materialoculto")){
                                                cantMateriales = Integer.parseInt(item.getString());
                                            }
                                            if (item.getFieldName().equals("material1")){
                                                material1 = item.getString();
                                            }
                                            materiales = new String[cantMateriales+1];
                                            for (int i=1; i<cantMateriales; i++){
                                                if (item.getFieldName().equals("material"+(i+1))){
                                                    session.setAttribute("material"+i, item.getString());
                                                }
                                            }
                                    }
                                    else
                                    {
                                        try{

                                                    file=new File(item.getName());
                                                    item.write(new File(destino,file.getName()));
                                                    objeto = ("Uploads/Tutorial/" + item.getName());
                                                    
                                                
                                        }catch(Exception e){
                                            break;
                                        }
                                    } // end if
                            }
                            try {            
                                sta.executeUpdate("call nuevoTutorial ("+ IdUsuario +", '"+ titulo +"', '"+descripcion+"', '"+ objeto +"', '"+ material1 +"');");
                                for (int i = 1; i<cantMateriales; i++){
                                    String dato = (String) session.getAttribute("material"+i);
                                    sta.executeUpdate("call nuevoMaterial('"+dato+"');");

                                }
                                out.println("<script>alert('El tutorial se ha registrado con éxito'); window.location.href = 'Tutoriales.jsp';</script>");
                                }
                             catch (SQLException error) {     
                                out.println("<script>alert('Ha ocurrido un error con tu publicacion');window.location.href = 'Tutoriales.jsp';</script>");
                                out.println(error);
                            }// end while
                    }
                con.close();
                %>
    </body>
</html>
