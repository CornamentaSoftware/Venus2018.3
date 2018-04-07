<%-- 
    Document   : Menu
    Created on : 04-nov-2017, 13:24:06
    Author     : rodri
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Venus</title>
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script|Montserrat|Raleway" rel="stylesheet">
        <link href="../font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css"/>
         <script src="../JS/desplegar.js" type="text/javascript"></script>
         <script src="../JS/subirArchivo.js" type="text/javascript"></script>
        <link href="../css/menu.css" rel="stylesheet" type="text/css"/>
        <link href="../css/menuA.css" rel="stylesheet" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link href="../css/TimeLine.css" rel="stylesheet" type="text/css"/>
        <link href="../font-Awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
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
    <body onload="deshabilitaRetroceso() " >
        <form name="publicar" action="Publicar2.jsp" enctype=multipart/form-data method="POST">
        <%@page import="java.io.*, java.text.SimpleDateFormat" %>
        <%
            String user = (String)session.getAttribute("usuario");
            String imagenperfil = (String)session.getAttribute("ImagenPerfil");
            
            if(user ==null)
            {
                response.sendRedirect("Inicio.html");
                return; //the return is important; forces redirect to go now
            }
            DateFormat formatter = DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM);           
            String conexion = (String) formatter.format(session.getAttribute("creacion"));
            
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            DateFormat otroformato = new SimpleDateFormat("HH:mm");
                       
            String ultima = (String) formatter.format(session.getAttribute("last"));
            
            long longDuracion= session.getCreationTime(); 
            Date duracion=new Date(longDuracion);
            Date actual = new Date();
            
            String crop = ("Tiempo en la sesion: " + duracion.getMinutes() + "min." + duracion.getSeconds()+"seg");
            int diferenciaHoras=actual.getHours() - duracion.getHours();
            int diferenciaMinutos=actual.getMinutes() - duracion.getMinutes();
            //Muestra el resultado en el textfield
            String hora="Tiempo en la sesion: "+diferenciaHoras+" horas, "+diferenciaMinutos+" minutos.";
            
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
        <div class="MenuA">
            <div class="Logo">
                <img src="../Img/logo3.png" alt=""/>
            </div>
                <div class="Venus"style="float: left">
                Venus
                </div>
            <div class="Derecha">
                <div class="Reloj" name="cron" id="cronometro">
                    <h2 class="letraReloj"><br><%=hora%><br>Ultima conexion: <%=conexion%></h2>
                </div>
                <ul class="ca-menu"> 
                    <li class="chico">
                        <a href="salir.jsp">
                            <span class="fa fa-sign-out" id="H"></span>
                            <div class="ca-content">
                                <h2 class="ca-main">Salir</h2>
                            </div>
                        </a>
                    </li>
                    <li class="grande">
                        <a href="">
                            <span class="fa fa-bell" id="M"></span>
                            <div class="ca-content">
                                <h2 class="ca-main">Notificaciones</h2>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container">
            <nav>
                <ul class="mcd-menu">
                        <li>
                            <a href="TimeLine.html" class="active">
                                <i class="fa fa-home"></i>
                                <strong>Home</strong>
                                <small>sweet home</small>
                            </a>
                        </li>
                        <li>
                            <a href="../Armario/Armario.jsp">
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
                            <a href="../Perfil/Perfil.jsp">
                                <i class="fa fa-user"></i>
                                <strong>Perfil</strong>
                                <small>Tu privacidad</small>
                            </a>
                            <ul>
                                <li><a href="../Perfil/MisOutfits.html"><i class="fa fa-tags"></i>Mis outfits</a></li>
                                <li><a href="../Perfil/Intereses.html"><i class="fa fa-heart"></i>Intereses</a></li>
                                <li><a href="../Perfil/Peticiones.html"><i class="fa fa-pencil"></i>Mis peticiones</a></li>
                                <li><a href="../Perfil/Contactos.jsp"><i class="fa fa-group"></i>Contactos</a></li>
                            </ul>
                        </li>
                    </ul>
            </nav>
        </div>
        <div class="TimeLine">
            <div class="bien">
                <center><h1 style="font-family: 'Dancing Script', cursive; color: #8d3536;;">¡Bienvenido: <%=user%>!  <img style="height: 50px; width: 50px; border-radius: 50%" src="../<%=imagenperfil%>"></h1></center>
                </div>
            <p class="DancingScript">Publicaciones</p>
            <textarea name="contenidoPublicacion" id="cajaPublicacion"> </textarea><br>
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
                        <div class="Publicaciones">
                <div class="publicacion">
                    <img src="../Img/Informacion/Ana.jpeg" alt=""/>
                    <p class="nombre Raleway">Ana Sánchez</p>
                    <p class="user Raleway">@AnaSan</p>
                    <p class="contenido">Creo que voy a odiarme toda la vida por no ser lo suficientemente bonita para ti.</p>
                    <div class="fechaHora">
                        <p class="fecha Raleway">13/11/2017</p>
                        <p class="hora Raleway">01:12 a.m.</p>
                    </div>
                </div>
                <div class="publicacion">
                    <img src="../Img/Chats/Danny.jpg" alt=""/>
                    <p class="nombre Raleway">Danny Corona</p>
                    <p class="user Raleway">@DannyCorona33</p>
                    <p class="contenido">Ya a nada de dejar este infierno.</p>
                    <div class="fechaHora">
                        <p class="fecha Raleway">12/11/2017</p>
                        <p class="hora Raleway">10:31 p.m.</p>
                    </div>
                </div>
                <div class="publicacion">
                    <img src="../Img/Perfil/Airam.jpg" alt=""/>
                    <p class="nombre Raleway">Airam Velázquez</p>
                    <p class="user Raleway">@Yami1999</p>
                    <p class="contenido">Qué recuerdos.</p>
                    <div class="imagenCuadro">
                        <div class="vertical">
                            <img src="../Img/Timeline/ouran.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="fechaHora">
                        <p class="fecha Raleway">12/11/2017</p>
                        <p class="hora Raleway">08:19 p.m.</p>
                    </div>
                </div>
            </div>
        </div>
            </div>
        <div class="Intercambiable">
            <p class="DancingScript">Intercambiable</p>
            <div class="todoInt">
                <div class="User">
                    <img src="../Img/user.png" alt=""/>
                </div>
                <div class="Img">
                    <img src="../Img/playera.JPG" alt=""/>
                </div>
            </div>
        </div>
        </form>
    </body>
</html>
