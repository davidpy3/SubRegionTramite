<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="clases.usuario" %>
<%@ page import="clases.expediente" %>
<%@ page import="clases.tramite" %>
<%@ page import="clases.tipo_tramite" %>
<%@ page import="clases.tramite_movimiento" %>
<%@ page import="clases.oficina" %>
<%@ page import="clases.area" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    String varUser=(String)session.getAttribute("varUsuario");
    if (varUser==null)response.sendRedirect("index.jsp");
    usuario cUsu= new usuario();
    cUsu.setUsuario(varUser);
    cUsu.buscar();

    expediente cExpe=new expediente();
            cExpe.setDni(cUsu.getDni());
            cExpe.buscar();
            tramite cTramite= new tramite();
           cTramite.setN_expeiente(cExpe.getN_expediente());
           cTramite.buscar_ultimo();

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" >
<head>
  <!-- base href="http://jspwebdesign.com/" -->
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="index, follow">
  <meta name="keywords" content="website, web site, development, design, lincoln, Nebraska, NE, john peterson,">
  <meta name="description" content="Joomla website development and design company in Lincoln, Nebraska.">
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management">
  <title>Sub Región</title>
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

<script type="text/javascript" src="style/superfish.js"></script>
<script type="text/javascript">jQuery(document).ready(function($){$('#nav ul.menu').superfish();});</script>
</head>

<body>
  
<div id="header">
   <div id="nav">
    <ul class="menu">
	<li  class="current_page_item current">	<a href="Menu.jsp"><span>Inicio</span></a></li>
	<li><a href="con_exp.jsp"><span>Ver expediente</span></a></li>
	<li ><a href="con_es_tra.jsp?tra=<% out.print(cTramite.getN_tramite()); %>"><span>Detalle de Tr&aacute;mite</span></a></li>
        <li><a href="../reportes/repexpediente.jsp?dni=<% out.print(cUsu.getDni()); %>"target="_blank"><span>Reporte Expediente</span></a></li>
    </ul>
   </div><!--/nav-->
    <h1 id="text-header"><a href="Menu.jsp" title="Sub-RegiÃ³n PacÃ­fico">Sub-Reg. Pac&iacute;fico</a></h1>
         <h2 id="text-slogan">Gobierno Reg. de Ancash</h2>
</div><!--/header-->
	<div id="main">
		  <div class="container_24" id="container">
		     <div class="mainbody">
                        <div class="grid_17 push_7">
                           <div id="content" class="l">
			       <div id="component-contact">
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="contentpaneopen">
<tr>
	<td width="100%" class="contentheading">
		Trámite: Núm. <%
           cTramite.buscar_ultimo();
           out.print(cTramite.getN_tramite()); %>	</td>
</tr>
<tr>
	<td>
		<table border="0" width="100%">
		<tr>
			<td></td>
			<td rowspan="2" align="right" valign="top">
						</td>
		</tr>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="116" >
		Asunto: 	</td>
</tr>
<tr>
  <td width="479" valign="top">
    <% out.print(cTramite.getAsunto()); %>	</td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td width="100" >
		<strong>Informaci&oacute;n:</strong> </td>
	<td>&nbsp;</td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="116" >
		Tipo de Tr&aacute;mite: 	</td>
</tr>
<tr>
  <td width="479" valign="top">
    <% tipo_tramite cTipTramite=new tipo_tramite();
            cTipTramite.setIdTipo_tramite(cTramite.getTip_tram());
            cTipTramite.buscar();
	   out.print( cTipTramite.getAbrev()+" ("+ cTipTramite.getNombre() +")" ); %>	</td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="116" >
		Fecha de Ingreso: 	</td>
</tr>
<tr>
  <td width="479" valign="top">
   <% out.print(cTramite.getFecha()); %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="116" >
		Referencia: 	</td>
</tr>
<tr>
  <td width="479" valign="top">
   <% out.print(cTramite.getReferencia()); %></td>
</tr>
</table>
<br />

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >
		Detalle: 	</td>
</tr>
<tr>
  <td width="510" valign="top">
   <% out.print(cTramite.getDetalle()); %></td>
</tr>
</table>
<br />

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >
		Observaciones: 	</td>
</tr>
<tr>
  <td width="510" valign="top">
   <% out.print(cTramite.getObservaciones()); %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td >
	  <strong>Ubicaci&oacute;n del tr&aacute;mite:</strong> </td>
	</tr>
</table>
<br />

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >
		Oficina: 	</td>
</tr>
<tr>
  <td width="510" valign="top">
   <%
            tramite_movimiento cTram_movi= new tramite_movimiento();
            cTram_movi.setTramite(cTramite.getN_tramite());
            cTram_movi.buscar_ultimo();

            oficina cOficina= new oficina();
            cOficina.setCodigo_oficina(cTram_movi.getCod_oficina());
            cOficina.buscar();
            area cArea=new area();
            cArea.setCod_area(cOficina.getCod_area());
            cArea.buscar();
            out.print(cOficina.getAbrev()+" ("+cOficina.getDescripcion() +") del área "+ cArea.getSiglas()+"("+ cArea.getDescripcion() +")");
           %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >
		Fecha envio: 	</td>
</tr>
<tr>
  <td width="510" valign="top"> <% out.print(cTram_movi.getFechaEnvio()); %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >Fecha recepci&oacute;n:</td>
</tr>
<tr>
  <td width="510" valign="top"><% out.print(cTram_movi.getFechaRecepcion()); %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >Prioridad: </td>
</tr>
<tr>
  <td width="510" valign="top"><% out.print(cTram_movi.getPrioridad()); %></td>
</tr>
</table>
<br />
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td rowspan="4" valign="top" width="123" >Estado:</td>
</tr>
<tr>
  <td width="510" valign="top"><% out.print(cTram_movi.getEstado()); %></td>
</tr>
</table>
<br />
			</td>
		</tr>
		</table>
	</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td></td>
</tr>
<tr>
	<td colspan="2">
	<br /><br />
	
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
<td><strong style="padding-left: 9px;">Usuario(<% out.print(varUser); %>)</strong><a href="Cerrar_sesion.jsp" class="mainlevel" >cerrar sesi&oacute;n</a></td>
</tr>
<tr >
<td style="padding-top:5px;"><a href="" class="mainlevel" ><strong>Datos del Usuario</strong></a></td>
</tr>
<tr >
<td style="padding-left: 9px;">DNI: <%out.print(cUsu.getDni()); %></td>
</tr>
<tr >
<td style="padding-left: 9px;">Ape. Nom. : <%out.print(cUsu.getApelllido()+" "+cUsu.getNombre()); %></td>
</tr>
<tr >
<td style="padding-top:7px;"><a href="" class="mainlevel" ><strong>N&uacute;mero de Expediente: <% out.print( cExpe.getN_expediente()); %></strong></a></td>
</tr>
<tr >
<td style="padding-left: 9px;">cantidad de Trámites: <% out.print(cTramite.cantidad_tramite()); %></td>
</tr>
<tr >
<td style="padding-left: 9px; padding-top:5px">Descripci&oacute;n:</td>
</tr>
<tr >
<td style="padding-left: 9px;"><% out.print(cExpe.getDescripcion()); %></td>
</tr>
</table></div></div></div></div>
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
					    <a href="http://www.joomlashack.com" title="Joomla Templates">kkkk</a>					  </div>
					  </div> 
				</div><!--/footer-->
                </body>
</html>