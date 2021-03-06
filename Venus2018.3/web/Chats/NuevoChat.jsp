<%-- 
    Document   : NuevoChat
    Created on : 04-abr-2018, 14:46:22
    Author     : rodri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/Chats/nuevoChat.css" rel="stylesheet" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="../css/Chats/detalles.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Raleway|Lobster+Two|Pacifico" rel="stylesheet">
        <link rel="stylesheet" href="../font-Awesome/css/font-awesome.min.css" type="text/css"/>
        <title>Venus</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
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
                        <a href="Chats.html" class="active">
                            <i class="fa fa-comments-o"></i>
                            <strong>Chats</strong>
                            <small>Siéntete libre de hablar</small>
                        </a>
                        <ul>
                            <li><a href="ChatsPublicos.html"><i class="fa fa-unlock-alt"></i>Públicos</a></li>
                            <li><a href="ChatsPrivados.html"><i class="fa fa-lock"></i>Privados</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../Tutoriales/Tutoriales.html">
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
            <p class="Pacifico fontsize60">Crear chat</p>
            <button class="btnFont desactivado right" id='sig' onclick="location.href='NuevoChat2.html';">Siguiente</button>
            <p class="Raleway">Selecciona a los usuarios que deseas agregar al chat</p>
            <div class="buscar">
                <div class="icono">
                    <spam class="fa fa-search iconoBuscar" aria-hidden="true"></spam>
                </div>
                <input type="text" class="inputBuscar" placeholder="Buscar usuarios">
                <a id="search-clear" href="#" class="fa fa-times-circle hide" aria-hidden="true"></a>
            </div>
            <div class="Usuarios">
                <div class="user">
                    <input type="checkbox" class="plus">
                    <img src="../Img/Chats/Danny.jpg" alt=""/>
                    <p class="Nombre">Daniela Corona</p>
                    <p class="usuario">@DannyCorona23</p>
                </div>
                <div class="user">
                    <input type="checkbox" class="plus">
                    <img src="../Img/Chats/Calixto.jpg" alt=""/>
                    <p class="Nombre">Jime Calixto</p>
                    <p class="usuario">@JimenaC</p>
                </div>
                <div class="user">
                    <input type="checkbox" class="plus">
                    <img src="../Img/Chats/Gabby.jpg" alt=""/>
                    <p class="Nombre">Gabby Salazar</p>
                    <p class="usuario">@LayshaAyala</p>
                </div>
            </div>
        </div>
    </body>
</html>
