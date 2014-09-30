<%-- 
    Document   : index
    Created on : 03-jun-2012, 21:27:17
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    String varUser=(String)session.getAttribute("varUsuario");
    if (varUser!=null)response.sendRedirect("Menu.jsp");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Logeo de Usuario - www.subregionpacifico.gob.pe</title>

<link href="style/login-box.css" rel="stylesheet" type="text/css" />
</head>

<body>


<div style="padding: 100px 0 0 250px;">

    <FORM name="Inicio_Sesion" METHOD="post" ACTION="InicSesion.jsp">
        <div id="login-box" >

<H2>Iniciar Sesi&oacute;n</H2> 
Sistema de Tr&aacute;mite documentarios
<br />
<br />
<div id="login-box-name" style="margin-top:20px;">Usuario:</div><div id="login-box-field" style="margin-top:20px;"><input name="usuario" class="form-login" title="Username" value="" size="30" maxlength="2048" /></div>
<div id="login-box-name">Clave:</div><div id="login-box-field"><input name="clave" type="password" class="form-login" title="Password" value="" size="30" maxlength="2048" /></div>
<br />
<span class="login-box-options"><a href="#" style="margin-left:30px;">Has olvidado tu clave?</a></span>
<br />
<br />
<input name="" value=" "  type="submit" style="margin-left:90px; background-image:url(style/login-btn.png); width:103px; height:42px; cursor: pointer;
cursor: hand;
position: relative;
border: none;background-color: transparent; ">
</div>

</FORM>











</body>
</html>

