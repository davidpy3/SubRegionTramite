<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.personal" %>
<%@page  import="clases.area" %>
<%@page  import="clases.oficina" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String varEmp=(String)session.getAttribute("varUsuarioad");
    if (varEmp==null)response.sendRedirect("index.jsp");
    personal cPer= new personal();
    cPer.setUsuario(varEmp);
    cPer.buscar();

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" >
<head>
  <!-- base href="http://jspwebdesign.com/" -->
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="index, follow">
  <meta name="keywords" content="website, web site, development, design, lincoln, Nebraska, NE, john peterson,">
  <meta name="description" content="Joomla website development and design company in Lincoln, Nebraska.">
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management">
  <title>Ofivina</title>
  <link href="http://jspwebdesign.com/index.php?format=feed&amp;type=rss" rel="alternate" type="application/rss+xml" title="RSS 2.0">
  <link href="http://jspwebdesign.com/index.php?format=feed&amp;type=atom" rel="alternate" type="application/atom+xml" title="Atom 1.0">
  <script type="text/javascript" src="style/jquery.js"></script>


<link rel="shortcut icon" href="http://jspwebdesign.com/images/favicon.ico">
<link href="style/reset.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="style/system.css" type="text/css">
<link rel="stylesheet" href="style/general.css" type="text/css">
<link href="style/960_24_col.css" rel="stylesheet" type="text/css" media="screen">
<link href="style/template.css" rel="stylesheet" type="text/css" media="screen">
<link href="style/superfish.css" rel="stylesheet" type="text/css" media="screen">
<link rel="stylesheet" href="style/style2.css" type="text/css">
<link rel="stylesheet" type="text/css" href="style/tablas.css" />
<script type="text/javascript" src="ajax.js"></script>


<script type="text/javascript" src="style/superfish.js"></script>
<script type="text/javascript">jQuery(document).ready(function($){$('#nav ul.menu').superfish();});</script>

<!--[if IE 6]>
<link href="/templates/orion/css/ie6.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/templates/orion/js/pngfix.js"></script>
<script type="text/javascript">
	DD_belatedPNG.fix('div#header span#graphic, div#header h1#graphic');
</script>
<![endif]-->

<!--[if IE 7]>
<link href="/templates/orion/css/ie7.css" rel="stylesheet" type="text/css" media="screen" />
<![endif]-->

<!--[if IE 8]>
<link href="/templates/orion/css/ie8.css" rel="stylesheet" type="text/css" media="screen" />
<![endif]-->



</head>

<body>
  
<div id="header">
  <div id="nav">
    
<ul class="menu">
	<li >
		<a href="Menu_Admin.jsp">
			<span>Área</span>
		</a>
	</li>
	<li class="current_page_item current">
		<a href="oficina.jsp">
			<span>Oficina</span>
		</a>
	</li>
    <li>
		<a href="personal.jsp">
			<span>Personal</span>
		</a>
	</li>
    <li>
		<a href="cargo.jsp">
			<span>Cargo</span>
		</a>
	</li>
    <li>
		<a href="tip_tramite.jsp">
			<span>Tipo de Trámite</span>
		</a>
	</li>
	
</ul>
  </div><!--/nav-->
    <h1 id="text-header"><a href="Menu.jsp" title="Sub-RegiÃ³n PacÃ­fico">Sub-Reg. Pac&iacute;fico</a></h1>
<h2 id="text-slogan">Gobierno Reg. de Ancash</h2></div><!--/header-->


  
  

				
		<div id="main">
		  <div class="container_24" id="container">
		    
		    <div class="mainbody">
                          <div class="grid_17 push_7">
                        
                        
                        
            

		    <div id="content" class="l">
			      
		      		                <div id="component-contact">
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="contentpaneopen">
<tr>
	<td width="100%" class="contentheading">
		Mantenedor Oficina</td>
</tr>

<tr>
	<td></td>
</tr>
<tr>
	<td colspan="2">
	<br /><br />
    <div id="mostrar">
	<form action="agregar_oficina.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
			<label for="siglas">
				&nbsp;Área:
			</label>
			<br />
            <select name="area"class="combo" >
            <% area cArea= new area();
               ArrayList<area> lArea= cArea.listar();
               Iterator iteratorA= lArea.iterator();
                         while(iteratorA.hasNext()){
                 cArea=(area)iteratorA.next();  %>
                 <option value="<% out.print(cArea.getCod_area()); %>"><% out.print(cArea.getDescripcion()); %></option>
              <% } %>
            </select>
			
			<br />
			<label for="descripcion">
				&nbsp;Abreviatura:
			</label>
			<br />
			<input type="text" id="descripcion" name="abrev" size="30" value="" class="inputbox" maxlength="100" />
			<br />
            <label for="descripcion">
				&nbsp;Descripción:
			</label>
			<br />
			<input type="text" id="descripcion" name="descripcion" size="30" value="" class="inputbox" maxlength="100" />
			<br />
			<label for="contact_subject">
				&nbsp;</label>
			<button class="button validate" type="submit">Guardar</button><br /><br />
			
		</div>
	</form>
    </div>
    <table class="lista">
                <tr>
			<th width="3%">id</th>
                        <th width="3%">Area</th>
			<th width="22%">Descripción</th>
			<th width="12%">Abreviatura</th>
			<th width="24%">Opciones</th>
		</tr>
            <%
              oficina cOfic= new oficina();
              ArrayList<oficina> lOficina= cOfic.listar();
              Iterator iterator= lOficina.iterator();
              while(iterator.hasNext()){
                 cOfic=(oficina)iterator.next(); %>
                <tr >
			<td><div align="center"><% out.print(cOfic.getCodigo_oficina()); %></div></td>
			<td><%
			cArea.setCod_area(cOfic.getCod_area());
                        cArea.buscar();
			 out.print(cArea.getSiglas()); %></td>
                        <td><% out.print(cOfic.getDescripcion()); %></td>
			<td><% out.print(cOfic.getAbrev()); %></td>

			<td valign="top">
                            <a onclick="seleccionar('seleccionar_oficina.jsp',<% out.print(cOfic.getCodigo_oficina()); %>);">Editar</a>
                            <a onclick="if(confirm('Seguro que deseas Eliminar')) {location.href='eliminar_oficina.jsp?id=<% out.print(cOfic.getCodigo_oficina()); %>' } ">Eliminar</a>
			  </td>
		</tr>
		<% } %>
				
			</table>
	<br />
    
	</td>
</tr>
</table>
</div>

          		    </div><!--/#content-->
		</div><!--grid_xx-->
		
				  			<div class="grid_7 pull_17">
						
						  <div class="sidebar">
					<div class="module"><div><div><div class="tl">
    	        
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr >
<td><strong style="padding-left: 9px;">Usuario(<% out.print(varEmp); %>)</strong><a href="cerrar_sesion_empleado.jsp" class="mainlevel" >cerrar sesi&oacute;n</a></td>
</tr>
<tr >
<td style="padding-top:5px;"><a href="" class="mainlevel" ><strong>Oficina que Labora: </strong></a></td>
</tr>
<tr >
    <td style="padding-left: 9px;"><%
    oficina cOficina= new oficina();
    cOficina.setCodigo_oficina(cPer.getCod_oficina());
    cOficina.buscar();
out.print(cOficina.getDescripcion());
%></td>
</tr>
<tr >
<td style="padding-top:5px;"><a href="" class="mainlevel" ><strong>Datos del Personal</strong></a></td>
</tr>
<tr >
    <td style="padding-left: 9px;">DNI: <% out.print(cPer.getDni()); %></td>
</tr>
<tr >
<td style="padding-left: 9px;">Ape. Nom. : <% out.print(cPer.getApellidoPaterno()+" "+cPer.getApellidoPaterno()+" "+cPer.getNombres()); %> </td>
</tr>
<tr >
<td style="padding-left: 9px;">Fecha de Nacimiento: <% out.print(cPer.getFecha_nac()); %> </td>
</tr>
<tr >
<td style="padding-top:5px;"><a href="" class="mainlevel" ><strong>Datos de Contacto</strong></a></td>
</tr>
<tr >
<td style="padding-left: 9px;">Telefono: <% out.print(cPer.getTelefono()); %> </td>
</tr>
<tr >
<td style="padding-left: 9px;">Domicilio: <% out.print(cPer.getDomicilio()); %> </td>
</tr>
<tr >
<td style="padding-left: 9px;">Email: <% out.print(cPer.getEmail()); %> </td>
</tr>
<tr >
  <td style="padding-left: 9px;">&nbsp;</td>
</tr>
</table>
</div></div></div></div>

				</div>
			</div><!--grid_xx-->
				
				<div class="clear"></div>
		</div><!--/container-->
      </div><!--/main-->
    	  </div><!--/mainbody-->
        
        <div id="footer">
					<div class="container_24">
                                      	</div><!--/#footer container_24-->
					<div id="copyright">
					  <div class="copy">
					    <a href="http://www.joomlashack.com" title="Joomla Templates">Joomla Templates</a>					  </div>
					    
					  </div> 
				</div><!--/footer-->
				

	</body>
</html>