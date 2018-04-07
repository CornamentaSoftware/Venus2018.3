
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chats</title>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
         <script src="../JS/chat.js" type="text/javascript"></script>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Raleway|Lobster+Two|Pacifico" rel="stylesheet">
        <link rel="stylesheet" href="../font-Awesome/css/font-awesome.min.css" type="text/css"/>
        <link href="../css/Chats/Chats.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            Connection c = null;
            Statement s = null;
            ResultSet r = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost/venus","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            
            HttpSession sesion = request.getSession();
            String id = sesion.getAttribute("IdUsuario").toString();
            
            out.println("<div class='Menu'><div class='Logo'><img src='../Img/logo3.png' alt=''/>>"
            + "</div><div class='Derecha'><ul class='ca-menu'><li class='chico'><a href='Aplicacion/Aplicacion.jsp'>"
            +"<span class='fa fa-sign-out' id='H'></span><div class='ca-content'><h2 class='ca-main'>Salir</h2>"
            +"</div></a></li><li class='grande'><a href='Practica/Practica.jsp'><span class='fa fa-bell' id='M'></span>"
            +"<div class='ca-content'><h2 class='ca-main'>Notificaciones</h2></div></a></li></ul></div>"
            +"<div class='Venus'>Venus</div></div><div class='Menu'><div class='Abrir'>"
            +"<button class='bars btnMenu' id='Abrir' style='visibility: hidden' onclick='w3_open><i class='fa fa-bars'></i>"
            + "<p>Menú</p></button></div><div class='container' id='mySidebar'><button onclick='w3_close()' class='btnMenu'>"
            +"<i class='fa fa-times' aria-hidden='true'></i><p>Cerrar</p></button><nav><ul class='mcd-menu'>"
            +"<li><a href='../Plantillas/TimeLine.html'><i class='fa fa-home'></i><strong>Home</strong><small>sweet home</small>"
            +"</a></li><li><a href='../Armario/Armario.html'><i class='fa fa-female'></i><strong>Armario</strong>"
            +"<small>Tu tesoro personal</small></a></li><li><a href=''><i class='fa fa-calendar'></i><strong>Calendario</strong>"
            +"<small>Agenda tu día a día</small></a><ul><li><a href='#'><i class='fa fa-refresh'></i>Ciclo</a></li></ul>"
            +"</li><li><a href='Chats.html' class='active'><i class='fa fa-comments-o'></i><strong>Chats</strong>"
            +"<small>Siéntete libre de hablar</small></a><ul><li><a href='ChatsPublicos.html'><i class='fa fa-unlock-alt'></i>Públicos</a></li>"
            +"<li><a href='ChatsPrivados.html'><i class='fa fa-lock'></i>Privados</a></li></ul></li><li><a href='../Tutoriales/Tutoriales.html'>"
            +"<i class='fa fa-picture-o'></i><strong>Tutoriales</strong><small>Aprende algo nuevo</small></a></li><li>"
            +"<a href='../Perfil/Perfil.html'><i class='fa fa-user'></i><strong>Perfil</strong><small>Tu privacidad</small></a><ul>"
            +"<li><a href='../Perfil/MisOutfits.html'><i class='fa fa-tags'></i>Mis outfits</a></li>"
            +"<li><a href='../Perfil/Intereses.html'><i class='fa fa-heart'></i>Intereses</a></li>"
            +"<li><a href='../Perfil/Peticiones.html'><i class='fa fa-pencil'></i>Mis peticiones</a></li>"
            +"<li><a href='../Perfil/Contactos.html'><i class='fa fa-group'></i>Contactos</a></li></ul></li>"
            +"</ul></nav></div></div><div class='msjChats'><div class='marginBottom'><p class='LobsterTwo color46373f'>Chats privados</p>"
            +"<p class='Raleway marginBottom0 left'>Selecciona algún chat o crea uno nuevo...</p>"
            +"<button class='btnFont right' id='nuevo' onclick="+"location.href='NuevoChat.jsp'>Crear chat</button></div>");
            
            try{
                
                r = s.executeQuery("select * from chat where Id_Creador = " + id + " && Id_CatChat=2;");
                
                while(r.next()){
                    
                    int idChat = r.getInt("Id_Chat");
                    String nom = r.getString("nombre");
                    
                    r = s.executeQuery("select * from mensaje where Id_Chat = " + idChat + ";");
                    if(r.next()){
                        String cont = r.getString("contenido");
                        String fecha = r.getDate("fecha").toString();
                        int idUs = r.getInt("Id_Usuario");
                        
                        if(r.next()){
                        r = s.executeQuery("select * from usuario where Id_Usuario = " + idUs + ";");
                        
                        out.println("<form class='Chats left' action='Chat.jsp'" 
                                + "<button class='nadaButton' type='submit'>"
                                +"<div class='veinte2'>"
                                +"<img src='../Img/Chats/2.jpg' alt=''/></div>"
                                +"<div class='datosChat'>"
                                +"<p class='Pacifico'>"+nom+"</p>"
                                +"<p class='Raleway margin0'>"+r.getString("Username_Usuario")+" : "+cont+"</p>"
                                +"<p class='Raleway margin0'>"+fecha+"</p>"
                                +"</div></button></form>");
                        }
                        else{}
                    }
                    else{}
                }
                
                r = s.executeQuery("select * from relChat_Usuario where Id_Usuario = " + id + ";");
                
                
                while(r.next()){
                    
                    int chat = r.getInt("Id_Chat");
                    int priv = r.getInt("Id_CatChat");
                    if(priv==2){
                        
                    r= s.executeQuery("select * from chats where Id_Chat = " + chat + ";");
                    
                    int idChat = r.getInt("Id_Chat");
                    String nom = r.getString("nombre");
                    
                    r = s.executeQuery("select * from mensaje where Id_Chat = " + idChat + ";");
                    if(r.next()){
                        String cont = r.getString("contenido");
                        String fecha = r.getDate("fecha").toString();
                        int idUs = r.getInt("Id_Usuario");
                        
                        r = s.executeQuery("select * from usuario where Id_Usuario = " + idUs + ";");
                        
                        if(r.next()){
                        
                        out.println("<form class='Chats left' action='Chat.jsp'" 
                                + "<button class='nadaButton' type='submit'>"
                                +"<div class='veinte2'>"
                                +"<img src='../Img/Chats/2.jpg' alt=''/></div>"
                                +"<div class='datosChat'>"
                                +"<p class='Pacifico'>"+nom+"</p>"
                                +"<p class='Raleway margin0'>"+r.getString("Username_Usuario")+" : "+cont+"</p>"
                                +"<p class='Raleway margin0'>"+fecha+"</p>"
                                +"</div></button></form>");
                        }
                        else{}
                    }
                    else{
                        
                    }
             
                    }
                }
             
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            
            out.println("</div></body></html>>");
            
            
            
            
        %>
  
        </div>
        
    </body>
</html>