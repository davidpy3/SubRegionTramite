<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.*" %>
<%@ page import="java.util.*" %>
<%
    String varEmp=(String)session.getAttribute("varUsuariomp");
    if (varEmp==null)response.sendRedirect("index.jsp");
    personal cPer= new personal();
    cPer.setUsuario(varEmp);
    cPer.buscar();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Trámite</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/docs.css" rel="stylesheet">
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
     <script src="assets/js/jquery.js"></script>
     <script src="assets/js/bootstrap-dropdown.js"></script>
     <script src="assets/js/application.js"></script>
<link rel="stylesheet" type="text/css" media="screen, projection" href="assets/css/demo.css" />
		<script type="text/javascript" src="assets/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
				function soloLetras(evt)
{    //Validar la existencia del objeto event
    evt = (evt) ? evt : event;
     //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
     //Predefinir como valido
    var respuesta = true;
     //Validar si el codigo corresponde a los NO aceptables
    if (charCode > 31 && ((charCode < 65 || charCode > 122)&&(charCode > 90 || charCode < 97)) )
    {  //Asignar FALSE a la respuesta si es de los NO aceptables
        respuesta = false;
    }     //Regresar la respuesta
    return respuesta;
}	//inicio solonumero
		function soloNumeros(evt)
{   //Validar la existencia del objeto event
    evt = (evt) ? evt : event;
    //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    //Predefinir como valido
    var respuesta = true;
    //Validar si el codigo corresponde a los NO aceptables
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    { //Asignar FALSE a la respuesta si es de los NO aceptables
        respuesta = false;
    }//Regresar la respuesta
    return respuesta;
}	
	function codeSec1() {  
       // var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";  
      var chars = "0123456789"; 
      var string_length = 6;  
      var randomstring = '';  
  
      for (var i=0; i<string_length; i++) {  
              var rnum = Math.floor(Math.random() * chars.length);  
                    randomstring += chars.substring(rnum,rnum+1);  
              }  
       // document.forms["form"]["codeSec"].value = randomstring; 
     document.getElementById("codeSec").innerHTML =  randomstring
} //fin solonumero
			$(document).ready(function() {
				$('input[type=checkbox]').click(function() {
				       thisCheckbox	= $(this);
					if(thisCheckbox.attr('checked')) 
						thisCheckbox.attr('checked', '');
					else
						thisCheckbox.attr('checked', 'checked');
				});
				
				$('table tr').click(function() {
					
					checkBox = $(this).children('td').children('input[type=checkbox]');
					
					if(checkBox.attr('checked'))
						checkBox.attr('checked', '');
					else
						checkBox.attr('checked', 'checked');
				});
				
				$('.check-all').click(function() {
					
					checkBox	= $('table tr').children('td').children('input[type=checkbox]');
					
					if($(this).attr('checked')) 
						checkBox.attr('checked', 'checked');
					else
						checkBox.attr('checked', '');		
				});
				
			});
			
		</script>

<script src="ajax.js" type="text/javascript"></script>

<script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.0.0/prototype.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/scriptaculous/1.9.0/scriptaculous.js?load=effects" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript" src="style/modalbox.js"></script>
	<link rel="stylesheet" href="style/modalbox.css" type="text/css" />
  </head>
  <body data-spy="scroll" data-target=".subnav" data-offset="50" onload="codeSec1();">
  <!-- Navbar
    ================================================== -->
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
      <!-- <div class="container"><a class="brand" href="./index.html">Bootstrap</a> </div>-->
      </div>
    </div>
    <div class="container">

<!-- Masthead
================================================== -->
<header class="jumbotron subhead" id="overview">
  <h1>Bandeja de Entrada</h1>
  <p class="lead">Bienvenido al Sistema de Tramite Documentario SubRegionPacidico</p>
  <div class="subnav">
    <ul class="nav nav-pills">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Trámites <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Menu_mesa_partes.jsp">Entrada</a></li>
          <li><a href="enviados.jsp">Enviados</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuario <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="usuario.jsp">Nuevo Usuario</a></li>
          <li><a href="tramite.jsp">Nuevo Trámite</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Reportes <b class="caret"></b></a>
      <ul class="dropdown-menu">
          <li><a href="reportes/repusuario.jsp">Reporte de Usuario</a></li>
          <li><a href="reportes/repmovimiento.jsp?id=<% out.print(cPer.getCod_oficina()); %>">Reporte de Movimiento</a></li>
        </ul>
        </li>
      <li><a href="Cerrar_sesion_mp.jsp">Salir</a></li>
     </ul>
  </div>
</header>
<section id="buttonGroups">
<form name="frm2" method="post" action="registrar_tramite.jsp">
<fieldset id="form">
<legend>Registrar Trámite:</legend>
<ol>
	<li> <label>Tipo de Trámite: </label><select name="tipt">
      <%
                tipo_tramite cTip_t= new tipo_tramite();
                ArrayList<tipo_tramite> lTip_T= cTip_t.listar();
                Iterator iterator= lTip_T.iterator();
                         while(iterator.hasNext()){
                 cTip_t=(tipo_tramite)iterator.next(); %>
                 <option value="<% out.print(cTip_t.getIdTipo_tramite()); %>"><% out.print(cTip_t.getNombre()); %></option>
            <% } %></select><div id="rptadni"></div></li>
   	<li><label>Núm. de Expedi: </label><input onkeypress="return soloNumeros(event);" name="nexp" type="text" id="nexp" size="20" value="<%
                    if(request.getParameter("dni")!=null){
                    expediente cExp= new expediente();
                    cExp.setDni(request.getParameter("dni"));
                    cExp.buscar();
                    out.print( cExp.getN_expediente());
                    } %>">
<input onClick="window.open('buscar_usu.jsp', '', 'toolbar=0,scrollbars=0,\n\
location=0,statusbar=0,menubar=0,resizable=0,width=600,height=300');" name="" type="button" value="..."></li>
   	<li><label>Fecha: </label><input name="fecha" type="text" id="fecha" size="20" value="<%
                Calendar c2 = new GregorianCalendar();
                int anio=c2.get(Calendar.YEAR);
                int mes=c2.get(Calendar.MONTH)+1;
                int dia=c2.get(Calendar.DATE);
        out.print(anio +"-"+ mes +"-"+ dia); %>"></li>
      <li><label>Asunto: </label><textarea   name="asunto" cols="40" rows="5" id="asunto"></textarea></li>    
      <li> <label>Referencia: </label><textarea name="refere" cols="40" rows="5" id="refere"></textarea></li>
      <li><label>Detalle: </label><textarea name="detalle" cols="40" rows="5" id="detalle"></textarea></li>
      <li><label>Cod Registro: </label> <textarea name="observa" id="codeSec" width:300px;height:80px></textarea></li>
      <p align="center"><input name="submit" class="btnee" value="registrar" type="submit"> </p>
  </ol></fieldset>
</form>
</section>
<section id="buttonDropdowns">
</section>
<section id="navs"></section>
<section id="navbar"></section>
<section id="breadcrumbs"></section>
<section id="pagination"></section>
<section id="labels"></section>
<section id="badges"></section>
<section id="badges"></section>
      <footer class="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>
             </footer>
    </div>
    </body>
</html>