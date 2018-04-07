var bool1 = true;
var bool2 = true;
var bool11 = false;
var bool22 = false;
function estrella() {
    if(bool1){
        //Está seleccionada = Es una prenda favorita
        document.getElementById("estrella").className = "fa fa-star estrella";
        document.getElementById("estrella").style.color = "#F6DA1E";
        document.getElementById("f").value="S";
        bool1=false;
    }else{
        //No está seleccionada = No es una prenda favorita
        document.getElementById("estrella").className = "fa fa-star-o estrella";
        document.getElementById("estrella").style.color = "#F6DA1E";
        document.getElementById("f").value="N";
        bool1=true;
    }
}
function estrella2() {
    if(bool11){
        //No está seleccionada = No es una prenda favorita
        document.getElementById("estrella").className = "fa fa-star-o estrella";
        document.getElementById("estrella").style.color = "#F6DA1E";
        document.getElementById("f").value="N";
        bool11=false;
    }else{
        document.getElementById("estrella").className = "fa fa-star estrella";
        document.getElementById("estrella").style.color = "#F6DA1E";
        document.getElementById("f").value="S";
        bool11=true;
    }
}

function intercambio() {
    if(bool2){
        //Está seleccionada = Es intercambiable
        document.getElementById("intercambio").style.color = "#E34B48";
        document.getElementById("i").value="S";
        bool2=false;
    }else{
        //No está seleccionada = No es intercambiable
        document.getElementById("intercambio").style.color = "#F0DCD8";
        document.getElementById("i").value="N";
        bool2=true;
    }
}
function intercambio2() {
    if(bool22){
        document.getElementById("intercambio").style.color = "#F0DCD8";
        document.getElementById("i").value="N";
        bool22=false;
    }else{
        document.getElementById("intercambio").style.color = "#E34B48";
        document.getElementById("i").value="S";
        bool22=true;
    }
}
            
            
            


