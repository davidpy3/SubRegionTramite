<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.personal" %>
<%@ page import="clases.area" %>
<%@ page import="clases.oficina" %>
<%@ page import="clases.tramite_movimiento" %>
<%@ page import="clases.tramite" %>
<%@ page import="java.util.*" %>
<%
    String varEmp=(String)session.getAttribute("varUsuariooa");
    if (varEmp==null)response.sendRedirect("index.jsp");
    personal cPer= new personal();
    cPer.setUsuario(varEmp);
    cPer.buscar();

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Documentos Derivados</title>
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
  <form name="frm" method="get">
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
  <h1>Bandeja de Enviados</h1>
  <p class="lead">Beienvenido al Sistema de Tramite Documentario SubRegionPacidico</p>
  <div class="subnav">
    <ul class="nav nav-pills">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Trámites <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="Menu_ot_area.jsp">Entrada</a></li>
          <li><a href="enviados_oa.jsp">Enviados</a></li>
        </ul>
      </li>
      
      <li><a href="#labels">Reportes</a></li>
      <li><a href="Cerrar_sesion_oa.jsp">Salir</a></li>
     </ul>
  </div>
</header>

<section id="buttonGroups">
<table>
		<tr>
			<th width="5%"><input type="checkbox" class="check-all" /></th>
			<th width="13%" class="col-name">Num. Trámite</th>
			<th width="45%" class="col-comment">Asunto</th>
			<th width="16%" class="col-response">Fecha de Envio</th>
            <th width="16%" class="col-response">Prioridad</th>
		</tr>
        <%
            tramite_movimiento cTram= new tramite_movimiento();
            cTram.setCod_oficina(cPer.getCod_oficina());
            ArrayList<tramite_movimiento> lTram= cTram.listar_x_oficina_s();
            Iterator iterator= lTram.iterator();
            int i=0;
             while(iterator.hasNext()){
                 cTram=(tramite_movimiento)iterator.next();
		%>
		<tr>
                    <td><input type="checkbox" id="rb<% i++;out.print(i); %>" name="rb<% out.print(i); %>" value="<% out.print(cTram.getTramite()); %>" /></td>
			<td class="col-name">
                            <% out.print(cTram.getTramite()); %>
			</td>
			<td class="col-comment">
                            <%
                            tramite cTra= new tramite();
                            cTra.setN_tramite(cTram.getTramite());
                            cTra.buscar();
                            out.print(cTra.getAsunto()); %>
			</td>
			<td class="col-response">
                            <% out.print(cTram.getFechaEnvio()); %>
			</td>
            <td class="col-response">
			<% out.print(cTram.getPrioridad()); %>
			</td>
		</tr>
		<% } %>
	</table>
</section>
<section id="buttonDropdowns">
<input type="hidden" id="cantidad" name="cantidad" value="<% out.print(i); %>"/>
<a href="#" title="Derivar Trámite " onclick="Modalbox.show($('testContent'), {title: this.title, height: 350 }); return false;">Derivar</a></section>
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
			<h1>Derivar Trámite</h1>
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
        </form>
  </body>
</html>
