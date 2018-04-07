<%-- 
    Document   : cambios
    Created on : 14/03/2018, 07:40:45 AM
    Author     : Alumno
--%>

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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            String nombre = "";
            String apellidos = "";
            String nombreCompleto = "";
            String correo = "";
            String username = "";
            String contraAnt = "";
            String contraNueva = "";
            String contraNuevaConf = "";
            String contraNuevaCifrada = "";
            boolean existe=false;
            
            String usernameAnterior = (String)session.getAttribute("usuario");
            
            Connection con = null;
            Statement sta = null;
            ResultSet result;
            
                String rutalocal=getServletContext().getRealPath("/");
                String rutacarp=rutalocal+"Uploads";
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
                                        if (item.getFieldName().equals("nombre"))
                                            nombre = item.getString();
                                        if (item.getFieldName().equals("apellido"))
                                            apellidos = item.getString();
                                        if (item.getFieldName().equals("correo"))
                                            correo = item.getString();
                                        if (item.getFieldName().equals("username"))
                                            username = item.getString();
                                        if (item.getFieldName().equals("ContraseniaAnterior"))
                                            contraAnt = item.getString();
                                        if (item.getFieldName().equals("ContraseniaNueva"))
                                            contraNueva = item.getString();
                                        if (item.getFieldName().equals("ContraseniaNuevaConf"))
                                            contraNuevaConf = item.getString();
                                }
				else
				{
					file=new File(item.getName());
					item.write(new File(destino,file.getName()));
                                        objeto = ("Uploads/" + item.getName());
					out.println("Fichero subido");
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

            Base buscar = new Base();
            String contraAnteriorCifrada ="";
            
            try{
                AES cifrar = new AES();
                contraAnteriorCifrada = cifrar.Encriptar(contraAnt, usernameAnterior);
                
                existe = buscar.buscarUsuario(usernameAnterior, contraAnteriorCifrada);
            }catch(SQLException error) {     
                out.println("<script>alert('La contraseña anterior es incorrecta');window.location.href = '../Plantillas/Inicio.html';</script>");
            }
            
            if (existe == true){
                try {
                    AES cifrar = new AES();
                    contraNuevaCifrada = cifrar.Encriptar(contraNueva, username);
                    
                        sta.executeUpdate("update usuario set Nombre_Usuario='"+nombre+"', Correo_Usuario='"+correo+"', Apellido_Usuario='"+apellidos+"', Username_Usuario='"+username+"', Contrasenia_Usuario='"+contraNuevaCifrada+"', Imagen_Usuario='"+objeto+"' where Username_Usuario='"+usernameAnterior+"' and Contrasenia_Usuario = '"+contraAnteriorCifrada+"';");          
                        con.close();
                        session.setAttribute("usuario", username);
                        session.setAttribute("contrasenia", contraNueva);
                        session.setAttribute("nombre", nombre);
                        session.setAttribute("ImagenPerfil", objeto);
                        out.println("<script>alert('Cambios realizados con éxito');window.location.href = 'Perfil.jsp';</script>");
                    }
                 catch (SQLException error) {     
                    out.println("<script>alert('Ha ocurrido un error con tus cambios');window.location.href = 'ModificarDatos.html';</script>");
                    out.println(error);
                }
                con.close();
            }
        %>
    </body>
</html>
