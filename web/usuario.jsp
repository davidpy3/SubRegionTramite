<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.personal" %>
<%@ page import="clases.area" %>
<%@ page import="clases.oficina" %>
<%@ page import="clases.tramite_movimiento" %>
<%@ page import="clases.tramite" %>
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
    <title>Usuario</title>
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
			
                        function soloNumeros(evt)
{
    //Validar la existencia del objeto event
    evt = (evt) ? evt : event;
 
    //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
 
    //Predefinir como valido
    var respuesta = true;
 
    //Validar si el codigo corresponde a los NO aceptables
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    {
        //Asignar FALSE a la respuesta si es de los NO aceptables
        respuesta = false;
    }
 
    //Regresar la respuesta
    return respuesta;
}	
                        
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

  <body data-spy="scroll" data-target=".subnav" data-offset="50">
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
<form name="frm2" method="post" action="registrar_usuario.jsp">
<fieldset id="form">
<legend>Registrar Usuario:</legend>
<ol>
 <li><label>DNI:</label>
     <input onkeypress="return soloNumeros(event);" name="dni" type="text" id="dni" size="20" 
            onKeyUp="if(this.value.length==8){consultarDNI(this.value)}">
     <div id="rptadni"></div></li>
      <li><label>Nombre: </label><input name="nombre" type="text" id="nombre" size="40" onkeyup="this.value=this.value.toUpperCase()"></li>
      <li><label>Apellidos: </label><input name="ape" type="text" id="ape" size="40" onkeyup="this.value=this.value.toUpperCase()"></li>   
      <li><label>Usuario: </label> <input name="usuario" type="text" id="usuario" size="25"></li>    
      <li><label>Clave: </label><input name="clave" type="password" id="clave" size="25"></li>
      <li><label>Describir Expediente: </label> <textarea name="descrip" cols="40" rows="5"></textarea></li>
    <p align="center"><input name="submit" class="btnee" value="Registrar" type="submit"></p>
</ol>
</fieldset>
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
    
    <div id="testContent" style="display: none">
			<h1 style="background: url(style/spinner.gif) 0 -5px no-repeat; padding-left: 50px">Derivar Trámite</h1>
			<p>Seleccione el área y la oficina para su envio. Fecha Actual: <%
                Calendar c2 = new GregorianCalendar();
        out.print(c2.get(Calendar.YEAR)+"-"+c2.get(Calendar.MONTH)+"-"+c2.get(Calendar.DATE)); %></p>
			<p>Área:<br/>
              <select onFocus="seleccionar('seleccionar_ofi_area.jsp',this.options[this.selectedIndex].value) "  onChange="seleccionar('seleccionar_ofi_area.jsp',this.options[this.selectedIndex].value) " name="area" id="area" size="1">
                <% area cArea= new area();
               ArrayList<area> lArea= cArea.listar();
               Iterator iteratorA= lArea.iterator();
                         while(iteratorA.hasNext()){
                 cArea=(area)iteratorA.next();  %>
                 <option value="<% out.print(cArea.getCod_area()); %>"><% out.print(cArea.getDescripcion()); %></option>
              <% } %>
              </select>
			</p>
			<p>Oficina: <div id="mostrar"> <select name="oficina" id="oficina" size="1">
			  
</select></div>
                            
</p><p>Prioridad: <select name="prioridad" id="prioridad" size="1">
			  <option value="ninguno">ninguno</option>
              <option value="urgente">urgente</option>
</select>
                            
</p>
			<p>	
			  <input type="submit" name="button_el" value="Derivar" id="button_el" onClick="raiz()"   />
			  <input type="button" name="close_btn" value="Close" id="close_btn" onClick="Modalbox.hide({beforeHide: function() { alert('Desea Salir'); } })" />
</p>
			
		</div>
  </body>
</html>
