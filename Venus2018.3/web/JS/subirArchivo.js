function cambia(){
    var pathFichero = document.getElementById("imagen").files[0].name;
    var pos = pathFichero.lastIndexOf("."); 
    var nomFich; 
    if (pos > 0) nomFich = pathFichero.substr( pos + 1 ) ;
    nomFich = pathFichero; 
    document.getElementById("texto").innerHTML=nomFich;
}
function cambiaPerfil(){
    var valor = document.getElementById("imagen").value;
    document.getElementById("texto").innerHTML=valor;
    document.getElementById("foto").style.fontSize="16px";
    document.getElementById("imagen").style.width="auto";
    document.getElementById("imagen").style.marginLeft="-125px";
}
