var ws;
        (function(window, document,JSON){
            'use strict';
            var url ='ws://'+window.location.host+'/VenusProject/chatbien';
             ws= new WebSocket(url);
            
            var boton = document.getElementById("btnenviar");
           
            
            ws.onopen = onOpen;
            ws.onclose = onClose;
            ws.onmessage = onMessage;
      
            
            
            function onOpen(){
                console.log('conectado....');
                
                
            }
                function onClose(){
                console.log('desconectado....');
            }
              
           
            function onMessage(evt){
                var obj = JSON.parse(evt.data),
                msg=obj.nombre+' dice: '+obj.mensaje,
                elnom = obj.nombre,
                msgtu= ' Tu: '+obj.mensaje; 
        
                if(elnom===(nombre.value))
                {
                   document.getElementById("conversacion").innerHTML += " <div class='contmio'><div class='mensajemio'>" +msgtu +"</div></div><br>";
               }
               else{
                   document.getElementById("conversacion").innerHTML += " <div class='cont'><div class='mensaje'>" +msg +"</div></div><br>";
                   
               }
            }
            

        })
        (window, document, JSON);
        
          function enviar(){
          
                        var msg={
                        nombre: nombre.value,
                        mensaje: mensaje.value
                    };
                ws.send(JSON.stringify(msg));
            } 
