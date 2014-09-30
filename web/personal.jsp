<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.personal" %>
<%@page  import="clases.area" %>
<%@page  import="clases.oficina" %>
<%@page  import="clases.cargo" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String varEmp=(String)session.getAttribute("varUsuarioad");
    if (varEmp==null)response.sendRedirect("index.jsp");
    personal cPer= new personal();
    

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" >
<head>
  <!-- base href="http://jspwebdesign.com/" -->
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="index, follow">
  <meta name="keywords" content="website, web site, development, design, lincoln, Nebraska, NE, john peterson,">
  <meta name="description" content="Joomla website development and design company in Lincoln, Nebraska.">
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management">
  <title>Personal</title>
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
	<li>
		<a href="oficina.jsp">
			<span>Oficina</span>
		</a>
	</li>
    <li class="current_page_item current">
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
		Mantenedor Personal</td>
</tr>

<tr>
	<td></td>
</tr>
<tr>
	<td colspan="2">
	<br /><br />
    <div id="mostrar">
	<form action="agregar_personal.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
		
<br />
			
		</div>
        <table width="607" border="0">
  <tr>
    <td width="53"><label for="nom">DNI: </label></td>
    <td width="246"><input type="text" id="descripcion2" name="dni" size="30" value="" class="inputbox" maxlength="8" /></td>
    <td width="40">&nbsp;</td>
    <td width="250">&nbsp;</td>
  </tr>
  <tr>
    <td><label for="telef">&nbsp;Oficina: </label></td>
    <td><select name="oficina"class="combo" id="oficina" >
            <%
            oficina cOfic= new oficina();
            ArrayList<oficina> lOficina= cOfic.listar();
              Iterator iteratorOficina= lOficina.iterator();
              while(iteratorOficina.hasNext()){
                 cOfic=(oficina)iteratorOficina.next();
			%>
                        <option value="<% out.print(cOfic.getCodigo_oficina()); %>"><% out.print(cOfic.getDescripcion()); %></option>
               <% } %>
            </select></td>
    <td>Cargo:</td>
    <td><select name="cargo"class="combo" id="cargo" >
            <%
            cargo cCargo= new cargo();
            ArrayList<cargo> lcargo= cCargo.listar();
              Iterator iteratorCargo= lcargo.iterator();
              while(iteratorCargo.hasNext()){
                 cCargo=(cargo)iteratorCargo.next();
			%>
                        <option value="<% out.print(cCargo.getIdcargo()); %>"><% out.print(cCargo.getNombre_cargo()); %></option>
               <% } %>
    </select></td>
  </tr>
  <tr>
    <td>Usuario:</td>
    <td><input type="text" id="usuario" name="usuario" size="30" value=""maxlength="12" /></td>
    <td>Clave:</td>
    <td><input type="password" id="descripcion4" name="clave" size="30" value="" class="inputbox" maxlength="12" /></td>
  </tr>
  <tr>
    <td>Ap. Paterno:</td>
    <td><input type="text" id="descripcion5" name="pPater" size="30" value=""maxlength="20" onkeyup="this.value=this.value.toUpperCase()" /></td>
    <td>Ap. Materno:</td>
    <td><input type="text" id="descripcion3" name="pMater" size="30" value=""maxlength="20" onkeyup="this.value=this.value.toUpperCase()" /></td>
  </tr>
  <tr>
    <td>Nombre:</td>
    <td colspan="3"><input type="text" id="descripcion6" name="nom" size="50" value=""maxlength="30" onkeyup="this.value=this.value.toUpperCase()" /></td>
    </tr>
  <tr>
    <td>Fecha Nac:</td>
    <td><input name="fecha" type="text" id="descripcion7" value="" size="30"maxlength="12" /></td>
    <td>Sexo:</td>
    <td><input name="sex" type="radio" id="radio" value="M" checked="checked" />
      <label for="">Masculino </label><input name="sex" type="radio" value="F" />
      Femenino</td>
  </tr>
  <tr>
    <td>Domicilio:</td>
    <td colspan="3"><input type="text" id="descripcion8" name="domicilio" size="50" value=""maxlength="50" /></td>
    </tr>
  <tr>
    <td>Telefono:</td>
    <td><input name="telef" type="text" id="descripcion9" value="" size="30"maxlength="12" /></td>
    <td>Email:</td>
    <td><input name="email" type="text" id="descripcion10" value="" size="30"maxlength="30" /></td>
  </tr>
  <tr>
    <td>Estado.</td>
    <td><input name="estado" type="text" id="descripcion11" value="" size="15"maxlength="4" /></td>
    <td>Tipo Usuario:</td>
    <td><select name="tip_usu"class="combo" id="tip_usu" >
    <option value="mp">Mesa de Partes</option>
                            <option value="oa">Otra &Aacute;rea</option>
                            <option value="ad">Admnistrador</option>
    </select></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<button class="button validate" type="submit">Guardar</button><br />
	</form>
    </div>
    <table class="lista">
                <tr>
			<th width="6%">DNI</th>
			<th width="22%">Apellidos y Nombres</th>
			<th width="12%">Domicilio</th>
			<th width="24%">Opciones</th>
		</tr>
            <%
              ArrayList<personal> lPersonal= cPer.listar();
              Iterator iterator= lPersonal.iterator();
              while(iterator.hasNext()){
                 cPer=(personal)iterator.next(); %>
                <tr >
			<td><div align="center"><% out.print(cPer.getDni()); %></div></td>
			<td><% out.print(cPer.getApellidoPaterno()+" "+ cPer.getApellidoMaterno()+" "+cPer.getNombres()); %></td>
			<td><% out.print(cPer.getDomicilio()); %></td>

			<td valign="top">
                            <a onclick="seleccionar('seleccionar_personal.jsp',<% out.print(cPer.getDni()); %>);">Editar</a>
                            <a onclick="if(confirm('Seguro que deseas Eliminar')) {location.href='eliminar_personal.jsp?id=<% out.print(cPer.getDni()); %>' } ">Eliminar</a>
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
	cPer.setUsuario(varEmp);
    cPer.buscar();
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