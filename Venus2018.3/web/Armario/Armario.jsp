<%-- 
    Document   : Armario
    Created on : 1/04/2018, 11:32:00 AM
    Author     : Marbella Velázquez
--%>

<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
        <link href="../css/Armario/Armario.css" rel="stylesheet" type="text/css"/>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Raleway|Lobster+Two|Pacifico" rel="stylesheet">
        <link rel="stylesheet" href="../font-Awesome/css/font-awesome.min.css" type="text/css"/>
        <link href="../css/Armario/nuevos.css" rel="stylesheet" type="text/css"/>
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
                        <a href="Armario.jsp" class="active">
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
        <%@page import="java.sql.*,java.io.*" %>
        <%
            String Usuario = session.getAttribute("usuario").toString();
            Connection c=null;
            Statement s=null;
            ResultSet r=null;
            int prendas=0;
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c=DriverManager.getConnection("jdbc:mysql://localhost/venus","root","n0m3l0");
                s=c.createStatement();
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            r=s.executeQuery("call select1('"+Usuario+"');");
                while(r.next()){
                    prendas++;
                }
            String [] tipoPrendas=new String[prendas];
            r=s.executeQuery("call seleccionarTipoPrendas('"+Usuario+"');");
                int w=0;
                while(r.next()){
                    String tipoPrenda=r.getString("prenda");
                    tipoPrendas[w]=tipoPrenda;
                    w++;
                }
            %>
        <div class="cuerpoNuevo">
            <p class="Raleway fontsize60 bolder">Armario</p>
            <button class="btnFont right" id='nuevo' onclick="location.href='NuevaPrenda.html';">Añadir Prenda</button>
            <div class='ContenidoA'>
                <%
                    int i = 0;
                    while(prendas!=0){
                        if(i==0)
                            out.println("<p class='no Etiqueta'>"+tipoPrendas[i]+"</p>");
                        else
                            out.println("<p class='si Etiqueta'>"+tipoPrendas[i]+"</p>");
                        
                        out.println("<div class='imagenes'>");
                        r=s.executeQuery("call ImagenTipoPrendaUsuario('"+Usuario+"','"+tipoPrendas[i]+"');");
                        while(r.next()){
                            String link=r.getString("imagen");
                            int idPrenda=r.getInt("Id_Prenda");
                            out.println("<form class='nadaForm' action='prenda.jsp' method='post'>");
                            out.println("<button class='nadaA' type='submit' onclick='location.href='ModificarPrenda.html';'>");
                            out.println("<img class='cien' src='../"+link+"'/>");
                            out.println("<input type='text' class='nadaInputTextFloatL' name='idPrenda' value='"+idPrenda+"'/>");
                            out.println("</button>");
                            out.println("</form>");
                        }
                        out.println("</div>");
                        prendas--;
                        i++;
                    }
                    %>
            </div>
        </div>
    </body>
</html>
