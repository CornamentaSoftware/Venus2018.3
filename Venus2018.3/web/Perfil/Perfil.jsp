<%-- 
    Document   : Perfil
    Created on : 14/03/2018, 02:40:06 PM
    Author     : Alumno
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Raleway|Lobster+Two|Pacifico" rel="stylesheet">
        <link rel="stylesheet" href="../font-Awesome/css/font-awesome.min.css" type="text/css"/>
        <link href="../css/Perfil/Inicio.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/subirArchivo.js" type="text/javascript"></script>
        <link href="../css/Perfil/cambios.css" rel="stylesheet" type="text/css"/>
        <title>Venus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function publicacion(){
                var texto = document.publicar.contenidoPublicacion.value;
                var imagen = document.publicar.image.value;
                
                if ((texto === "" || texto === " ") && imagen === ""){
                    alert("Para realizar una publicación necesitas ingresar una imagen o un texto");
                }
                else{
                    document.publicar.submit() 
                }
            }
            
        </script>
    </head>
    <body>
        <%
            String user = (String)session.getAttribute("usuario");
            String imagenperfil = (String)session.getAttribute("ImagenPerfil");
            String nombre = (String)session.getAttribute("nombre");
            String IdUsuario = (String)session.getAttribute("IdUsuario");
            
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
            
            ResultSet resultado = sta.executeQuery("select * from publicacion where Id_Usuario = '"+IdUsuario+"' order by fecha desc") ;
        %>
        <form name="publicar" action="Publicar.jsp" enctype=multipart/form-data method="POST">
        <div class="MenuA">
            <div class="Logo">
                <img src="../Img/logo3.png" alt=""/>
            </div>
            <div class="Derecha">
                <ul class="ca-menu">
                    <li class="chico">
                        <a href="../Plantillas/Inicio.html">
                            <span class="fa fa-sign-out" id="H"></span>
                            <div class="ca-content">
                                <h2 class="ca-main">Salir</h2>
                            </div>
                        </a>
                    </li>
                    <li class="grande">
                        <a href="#">
                            <span class="fa fa-bell" id="M"></span>
                            <div class="ca-content">
                                <h2 class="ca-main">Notificaciones</h2>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="Venus">
                Venus
            </div>
        </div>
        <div class="Menu">
        <div class="Abrir">
            <button class="bars btnMenu" id="Abrir" style="visibility: hidden" onclick="w3_open()">
                <i class="fa fa-bars"></i><p>Menú</p>
            </button>
        </div>
        <div class="container" id="mySidebar">
        <button onclick="w3_close()" class="btnMenu">
            <i class="fa fa-times" aria-hidden="true"></i><p>Cerrar</p>
        </button> 
            <nav>
                <ul class="mcd-menu">
                    <li>
                        <a href="../Plantillas/Menu.jsp">
                            <i class="fa fa-home"></i>
                            <strong>Home</strong>
                            <small>sweet home</small>
                        </a>
                    </li>
                    <li>
                        <a href="../Armario/Armario.html">
                            <i class="fa fa-female"></i>
                            <strong>Armario</strong>
                            <small>Tu tesoro personal</small>
                        </a>
                    </li>
                    <li>
                        <a href="../Calendario_y_agenda/Calendario.html">
                            <i class="fa fa-calendar"></i>
                            <strong>Calendario</strong>
                            <small>Agenda tu día a día</small>
                        </a>
                        <ul>
                            <li><a href="#"><i class="fa fa-refresh"></i>Ciclo</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../Chats/Chats.html">
                            <i class="fa fa-comments-o"></i>
                            <strong>Chats</strong>
                            <small>Siéntete libre de hablar</small>
                        </a>
                        <ul>
                            <li><a href="../Chats/ChatsPublicos.html"><i class="fa fa-unlock-alt"></i>Públicos</a></li>
                            <li><a href="../Chats/ChatsPrivados.html"><i class="fa fa-lock"></i>Privados</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../Tutoriales/Tutoriales.jsp">
                            <i class="fa fa-picture-o"></i>
                            <strong>Tutoriales</strong>
                            <small>Aprende algo nuevo</small>
                        </a>
                    </li>
                    <li>
                        <a href="Perfil.jsp"  class="active">
                            <i class="fa fa-user"></i>
                            <strong>Perfil</strong>
                            <small>Tu privacidad</small>
                        </a>
                        <ul>
                            <li><a href="MisOutfits.html"><i class="fa fa-tags"></i>Mis outfits</a></li>
                            <li><a href="Intereses.html"><i class="fa fa-heart"></i>Intereses</a></li>
                            <li><a href="Peticiones.jsp"><i class="fa fa-pencil"></i>Mis peticiones</a></li>
                            <li><a href="Contactos.jsp"><i class="fa fa-group"></i>Contactos</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        </div>
        <div class="Inicio">
            <div class="PublicacionesGeneral">
                <p class="Raleway">Publicaciones</p>
                <textarea name="contenidoPublicacion" id="cajaPublicacion"></textarea><br>
                <button type="button" class="fa fa-picture-o imagen btn btnSR" id="foto">
                    <p class="nada" id="texto" name="imagenTexto"></p>
                    <input type="file" accept=".jpg, .jpeg, .png" id="imagen" onchange="cambia(), diseno();" class="inputfile" name="image" required=""/>
                </button>
                <button type="button" class="btn btnR btnDerecha" onclick="publicacion()">Publicar</button>
                <div class="Publicaciones">
                    
                        <%
                            while(resultado.next()){
                            out.println("<div class='publicacion'>");
                            
                                out.println("<img src='../" + imagenperfil + "'/>");
                                out.println("<p class='nombre Raleway'>"+nombre+"</p>");
                                out.println("<p class='user Raleway'>"+user+"</p>");
                                out.println("<p class='contenido'> "+ resultado.getString("contenido") +" </p>");
                                
                                    out.println("<div class='imagenCuadro'>");
                                        out.println("<div class='vertical'>");
                                        out.print("<img src='../"+ resultado.getString("imagen") +"' class='publicacionImg' alt=''/>");
                                        out.println("</div>");
                                    out.println("</div>");
                                    
                                    out.println("<div class='fechaHora'>");
                                        out.println("<p class='fecha Raleway'>"+ resultado.getString("fecha") +"</p>");
                                    out.println("</div>");
                                    
                            out.println("</div>");
                            }
                        %>
                    
                </div>
            </div>
        </div>
        <div class="Datos">
            <center>
                <div class="NombreUser">
                    <p class="nombreS"><%=nombre%></p>
                    <p class="userS"><%=user%></p>
                </div>
                <img src="../<%=imagenperfil%>" alt=""/>     
                <button class="btnFont" id="modificar" onclick="location.href='ModificarDatos.html'">Modificar Datos</button>
            </center>
        </div>
        </form>
    </body>
</html>
