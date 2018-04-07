<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="../Img/logo3.png">
        <link rel="stylesheet" href="../css/menuA.css" type="text/css"/>
        <link href="../css/General.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../css/menu.css" type="text/css">
        <link href="../css/desplegable.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/desplegar.js" type="text/javascript"></script>
        <link href="../css/Armario/Armario.css" rel="stylesheet" type="text/css"/>
        <link href="../css/Armario/nuevos.css" rel="stylesheet" type="text/css"/>
        <link href="../css/botones.css" rel="stylesheet" type="text/css"/>
        <link href="../css/Armario/nuevos.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/Armario.FavInt.js" type="text/javascript"></script>
        <script src="../JS/Validaciones.js" type="text/javascript"></script>
        <script src="../JS/subirArchivo.js" type="text/javascript"></script>
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
                        <a href="Chats.html">
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
            <center>
                <p class="Pacifico fontsize60">Modificar datos prenda</p>
            </center>
            <form class="DivRosa" enctype=multipart/form-data action='modificarPrenda.jsp' method="post">
                <div class="size">
                    <%@page import="java.sql.*,java.io.*" %>
                    <%
                        Connection c=null;
                        Statement s=null;
                        ResultSet r=null;
                        String talla="";
                        String tipoPrenda="";
                        String link="";
                        String intercambiable="";
                        String favorito="";
                        String precio="";
                        String descripcion="";
                        
                        int idPrenda = Integer.parseInt(request.getParameter("idPrenda"));
                        try{
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            c=DriverManager.getConnection("jdbc:mysql://localhost/venus","root","n0m3l0");
                            s=c.createStatement();
                        }
                        catch(SQLException error){
                            out.print(error.toString());
                        }
                        
                        r=s.executeQuery("call select2("+idPrenda+");");
                        while(r.next()){
                            link=r.getString("imagen");
                            talla=r.getString("talla");
                            tipoPrenda=r.getString("prenda");
                            intercambiable=r.getString("intercambiable");
                            favorito=r.getString("favorito");
                            precio=r.getString("precio");
                            descripcion=r.getString("descripcion");
                        }
                        %>
                        <%
                            if(favorito.equals("N"))
                                out.println("<span onclick='estrella();' class='fa fa-star-o estrella' id='estrella' aria-hidden='true'></span>");
                            else
                                out.println("<span onclick='estrella2();' class='fa fa-star estrella' id='estrella' aria-hidden='true'></span>");
                            if(intercambiable.equals("N"))
                                out.println("<span onclick='intercambio();' class='fa fa-exchange intercambio' id='intercambio' aria-hidden='true'></span>");
                            else
                                out.println("<span onclick='intercambio2();' class='fa fa-exchange intercambio2' id='intercambio' aria-hidden='true'></span>");
                            %>
                </div>
                <%
                    out.println("<center>");
                        out.println("<img src='../"+link+"'/>");
                        out.println("</center>");
                    out.println("Talla");
                    out.println("<select name='talla' required>");
                    String [] valoresTalla = {"Extra Chico","Chico","Mediano","Grande","Extra Grande"};
                    for(int i=0;i<4;i++){
                        if(valoresTalla[i].equals(talla))
                            out.println("<option value='"+(i+1)+"' selected>"+valoresTalla[i]+"</option>");
                        else
                            out.println("<option value='"+(i+1)+"'>"+valoresTalla[i]+"</option>");
                    }
                    out.println("</select>");
                    out.println("<input type='text' id='i' name='i' value='N' class='nadaInputTextFloatL'>");
                    out.println("<input type='text' id='f' name='f' value='N' class='nadaInputTextFloatL'>");
                    out.println("<input type='text' name='link' value='"+link+"' class='nadaInputTextFloatL'>");
                    out.println("<input type='text' name='idPrendaSelect' value='"+idPrenda+"' class='nadaInputTextFloatL'>");
                    out.println("<br>");
                    out.println("<select name='tipoPrenda' required>");
                    String [] valoresTipoPrenda = {"Falda","Playera","Blusa","Pantalón","Short","Accesorio","Gorro","Sueter","Sudadera","Chamarra","Vestido"};
                    for(int i=0;i<11;i++){
                        if(valoresTipoPrenda[i].equals(tipoPrenda))
                            out.println("<option value='"+(i+1)+"' selected>"+valoresTipoPrenda[i]+"</option>");
                        else
                            out.println("<option value='"+(i+1)+"'>"+valoresTipoPrenda[i]+"</option>");
                    }
                    out.println("</select>");
                    out.println("<br>");
                    out.println("Precio");
                    out.println("<input type='text' class='R' name='precio' onkeypress='return soloEnteros(event)' value="+precio+" required>");
                    out.println("<br>");
                    out.println("Descripción");
                    out.println("<textarea class='R' name='descripcion' onkeypress='return todo(event)' required>"+descripcion+"</textarea>");
                    out.println("<span class='iborrainputfile' id='valor'>");
                    out.println("<i class='fa fa-upload subir'></i>");
                    out.println("<p class='nada' id='texto'>Modificar imagen prenda</p>");
                    out.println("<input type='file' name='fichero' accept='.jpg, .jpeg, .png' id='imagen' onchange='cambia();' class='inputfile'/>");
                    out.println("</span>");
                    out.println("<center><button type='submit'>Guardar cambios</button></center>");
                    %>
            </form>
        </div>
    </body>
</html>
