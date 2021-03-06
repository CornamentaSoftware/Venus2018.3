<%-- 
    Document   : Tutoriales
    Created on : 02-abr-2018, 22:45:33
    Author     : rodri
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
        <link href="../css/Tutoriales/Tutoriales.css" rel="stylesheet" type="text/css"/>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Raleway|Lobster+Two|Pacifico" rel="stylesheet">
        <link rel="stylesheet" href="../font-Awesome/css/font-awesome.min.css" type="text/css"/>
        <script src="../JS/Validacion.js" type="text/javascript"></script>
        <script src="../JS/subirArchivo.js" type="text/javascript"></script>
        <title>Venus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <% 
            Connection con = null;
            Statement sta = null;
            ResultSet result;
            
            String user = (String)session.getAttribute("usuario");
            String imagenperfil = (String)session.getAttribute("ImagenPerfil");
            String nombre = (String)session.getAttribute("nombre");
            String IdUsuario = (String)session.getAttribute("IdUsuario");
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/VENUS", "root", "n0m3l0");
                sta = con.createStatement();
                } catch (SQLException error) {
                    out.print(error.toString());
                }
            
            ResultSet resultado = sta.executeQuery("select * from tutorial order by fecha desc") ;
        %>
        <div class="MenuA">
            <div class="Logo">
                <img src="../Img/logo3.png" alt=""/>
            </div>
            <div class="Derecha">
                <ul class="ca-menu">
                    <li class="chico">
                        <a href="Aplicacion/Aplicacion.jsp">
                            <span class="fa fa-sign-out" id="H"></span>
                            <div class="ca-content">
                                <h2 class="ca-main">Salir</h2>
                            </div>
                        </a>
                    </li>
                    <li class="grande">
                        <a href="Practica/Practica.jsp">
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
                        <a href="../Plantillas/TimeLine.html">
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
                        <a href="">
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
                        <a href="Tutoriales.html" class="active">
                            <i class="fa fa-picture-o"></i>
                            <strong>Tutoriales</strong>
                            <small>Aprende algo nuevo</small>
                        </a>
                    </li>
                    <li>
                        <a href="../Perfil/Perfil.html">
                            <i class="fa fa-user"></i>
                            <strong>Perfil</strong>
                            <small>Tu privacidad</small>
                        </a>
                        <ul>
                            <li><a href="../Perfil/MisOutfits.html"><i class="fa fa-tags"></i>Mis outfits</a></li>
                            <li><a href="../Perfil/Intereses.html"><i class="fa fa-heart"></i>Intereses</a></li>
                            <li><a href="../Perfil/Peticiones.html"><i class="fa fa-pencil"></i>Mis peticiones</a></li>
                            <li><a href="../Perfil/Contactos.html"><i class="fa fa-group"></i>Contactos</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        </div>
        <div class="cuerpoNuevo">
            <button class="btnFont right" id='nuevo' onclick="location.href='NuevoTutorial.html';">Añadir Tutorial</button>
            <p class="Pacifico fontsize60">Tutoriales</p>
            Busca algún totorial de tu interés, por descripción o título
            <div class="buscar">
                <div class="icono">
                    <spam class="fa fa-search iconoBuscar" aria-hidden="true"></spam>
                </div>
                <input type="text" class="inputBuscar" placeholder="Buscar tutorial">
                <a id="search-clear" href="#" class="fa fa-times-circle hide" aria-hidden="true"></a>
            </div>
            <div class="Tutoriales FBD0BF">
                <div class="publicacion">
                    <div class="fechaHora">
                        <p class="fecha Raleway">25/11/2017</p>
                        <p class="hora Raleway">06:55 p.m.</p>
                    </div>
                    <img src="../Img/Informacion/China.jpeg" class="ImgP" alt=""/>
                    <p class="nombre Raleway">Karla Gracia</p>
                    <p class="user Raleway">@KarlaG</p>
                    <p class="NombreO">Uñas Navidad</p>
                    <div class="final">
                        <img src="../Img/Tutoriales/final.jpg" alt=""/>
                    </div>
                    <div class="piezas">
                        <img src="../Img/Tutoriales/1.jpg" alt=""/>
                        <img src="../Img/Tutoriales/2.jpg" alt=""/>
                        <img src="../Img/Tutoriales/3.jpg" alt=""/>
                        <img src="../Img/Tutoriales/4.jpg" alt=""/>
                        <img src="../Img/Tutoriales/5.jpg" alt=""/>
                        <img src="../Img/Tutoriales/7.jpg" alt=""/>
                    </div>
                    <div  class="dMateriales">
                    <p class="Raleway descripcion">Este es un pequeño tutorial suuúper sencillo. Chicas en serio deben hacer este diseño
                        para navidad, dediquen un poco de tiempo a cuidarse, quererse y tener unas uñas fabulosas para estas fiestas </p>                    
                    </div>
                    <div class="dMateriales">
                        <p class="Materiales">Materiales</p>
                        <p class="Lista">
                            💖 Esmalte amarillo, blanco y negro<br>
                            💖 Picadientes o pincel delgado (para los detalles pequeños)<br>
                            💖 Mucha paciencia
                        </p>
                    </div> 
                </div>
            </div>
            <div class="Tutoriales FEAE93">
                <div class="publicacion">
                    <div class="fechaHora">
                        <p class="fecha Raleway">20/11/2017</p>
                        <p class="hora Raleway">11:29 p.m.</p>
                    </div>
                    <img src="../Img/Perfil/Airam.jpg" class="ImgP" alt=""/>
                    <p class="nombre Raleway">Airam Velázquez</p>
                    <p class="user Raleway">@Yami1999</p>
                    <p class="NombreO">Postre Navideño</p>
                    <div class="I">
                        <div class="Video">
                            <video controls>
                                <source src="videoTutorial.mp4" type="video/mp4">
                            </video>
                        </div>
                        <p class="Raleway descripcionV">Una pequeña receta deliciosa, perfecta y sencilla para esta temporada</p> 
                    </div>
                    <div class="dMateriales">
                        <p class="Materiales">Materiales</p>
                        <p class="Lista">
                            💜 3 Huevos<br>
                            💜 300 ml de leche condensada<br>
                            💜 200 ml de leche<br>
                            💜 150 ml de leche evaporada<br>
                            💜 50 ml de crema de leche<br>
                            💜 2 cdas de canela en polvo<br>
                            💜 2 cdas de vainilla<br>
                            💜 16-20 rebanadas de pan<br>
                            💜 150 gr de pasas<br>
                            💜 4 cdas de azucar morena<br>
                            💜 3 cdas de canela en polvo<br>
                            💜 40 gr de matequilla<br>
                            💜 Helado de vainilla (al gusto)<br>
                            💜 Muchas ganas de devorar<br>
                        </p>
                    </div> 
                </div>
            </div>
            <%
            while(resultado.next()){
                    out.println("<div class=Tutoriales FEAE93'>");
                       out.println("<div class='publicacion'>");
                           out.println("<div class='fechaHora'");
                               out.println("<p class='fecha Raleway'>20/11/2017</p>");
                               out.println("<p class='hora Raleway'>11:29 p.m.</p>");
                           out.println("</div>");
                           out.println("<img src='../Img/Perfil/Airam.jpg' class='ImgP' alt=''/>");
                           <p class="nombre Raleway">Airam Velázquez</p>
                           <p class="user Raleway">@Yami1999</p>
                           <p class="NombreO">Postre Navideño</p>
                           <div class="I">
                               <div class="Video">
                                   <video controls>
                                       <source src="videoTutorial.mp4" type="video/mp4">
                                   </video>
                               </div>
                               <p class="Raleway descripcionV">Una pequeña receta deliciosa, perfecta y sencilla para esta temporada</p> 
                           </div>
                           <div class="dMateriales">
                               <p class="Materiales">Materiales</p>
                               <p class="Lista">
                                   💜 3 Huevos<br>
                                   💜 300 ml de leche condensada<br>
                                   💜 200 ml de leche<br>
                                   💜 150 ml de leche evaporada<br>
                                   💜 50 ml de crema de leche<br>
                                   💜 2 cdas de canela en polvo<br>
                                   💜 2 cdas de vainilla<br>
                                   💜 16-20 rebanadas de pan<br>
                                   💜 150 gr de pasas<br>
                                   💜 4 cdas de azucar morena<br>
                                   💜 3 cdas de canela en polvo<br>
                                   💜 40 gr de matequilla<br>
                                   💜 Helado de vainilla (al gusto)<br>
                                   💜 Muchas ganas de devorar<br>
                               </p>
                           </div> 
                       </div>
                   </div>
                %>
        </div>
    </body>
</html>
