// JavaScript Document


function objetoAjax(){
	var xmlhttp=false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
		   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
  		}
	}

	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function consultarDNI(id){
	divContenido = document.getElementById('rptadni');
	ajax=objetoAjax();
	ajax.open("GET","buscar_dni.jsp?dni="+id);
	ajax.onreadystatechange=function() {
		if (ajax.readyState==4) {
			divContenido.innerHTML = ajax.responseText;
		}
	}
	ajax.send(null)
}

function seleccionar(pag,id){
	divContenido = document.getElementById('mostrar');
	ajax=objetoAjax();
	ajax.open("GET", pag+"?id="+id);
	ajax.onreadystatechange=function() {
		if (ajax.readyState==4) {
			divContenido.innerHTML = ajax.responseText;
		}
	}
	ajax.send(null)
}


function derivar(id,oficina,prioridad){
	ajax=objetoAjax();
			ajax.open("GET", "derivar.jsp?id="+id+"&ofi="+oficina+"&prio="+prioridad);
			ajax.onreadystatechange=function() {
				if (ajax.readyState==4) {
					//alert(ajax.responseText);
				}
			}
			ajax.send(null)
}

function r() { location.href="Menu_mesa_partes.jsp" } 
function roa() { location.href="Menu_ot_area.jsp" }

function raiz(){
	contenidodiv=document.getElementById('testContent');
	cantidad=document.getElementById('cantidad').value;
	var i=1;
	while (i<=cantidad)
  	{
		radio=document.getElementById('rb'+i).checked;
		tram=document.getElementById('rb'+i).value;
		ofi=document.getElementById('oficina').value;
		prio=document.getElementById('prioridad').value;
		
		if(radio==true){
			derivar(tram,ofi,prio);
		}
		i++;
 	}
	contenidodiv.innerHTML ="<h1 style='background: url(style/spinner.gif) 0 -5px no-repeat; padding-left: 50px'>Enviando Trámite</h1>";
	setTimeout ("r()", 2000);
}
function raiz_oa(){
	contenidodiv=document.getElementById('testContent');
	cantidad=document.getElementById('cantidad').value;
	var i=1;
	while (i<=cantidad)
  	{
		radio=document.getElementById('rb'+i).checked;
		tram=document.getElementById('rb'+i).value;
		ofi=document.getElementById('oficina').value;
		prio=document.getElementById('prioridad').value;
		
		if(radio==true){
			derivar(tram,ofi,prio);
		}
		i++;
 	}
	contenidodiv.innerHTML ="<h1 style='background: url(style/spinner.gif) 0 -5px no-repeat; padding-left: 50px'>Enviando Trámite</h1>";
	setTimeout ("roa()", 2000);
}
