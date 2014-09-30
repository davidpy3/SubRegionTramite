<%-- 
    Document   : index
    Created on : 25/11/2010, 08:21:09 AM
    Author     : WORK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    String varUser=(String)session.getAttribute("varUsuario");
    if (varUser!=null)response.sendRedirect("usuario/Menu.jsp");
    String varUserad = (String) session.getAttribute("varUsuarioad");
            if (varUserad!=null)response.sendRedirect("Menu_Admin.jsp");
            String varUsermp = (String) session.getAttribute("varUsuariomp");
            if (varUsermp!=null)response.sendRedirect("Menu_mesa_partes.jsp");
            String varuseroa= (String) session.getAttribute("varUsuariooa");
            if (varuseroa!=null)response.sendRedirect("Menu_ot_area.jsp");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
         <meta name="description" content="Tutorial : Showing Product Information With CSS3 3D Transform">
  <meta name="author" content="Webstuffshare">
  <link rel="stylesheet" href="demo.css?v=2">


<meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
  
<link href="formularioContacto.css" rel="stylesheet" type="text/css" media="screen" />
        <title>Index</title>
      </head>
    <body>
       

  <div id="container">
    
    <h1>Bienvenidos al Sistema De Tramite Documentario<br></br>SubRegionPacifico</h1>
    
    <div class="wrapper">
      <div class="item">
        <img src="images/contact.png" />
        <span class="information">
            <%--                                       LOGIN DE SUPERADMINISTRADOR                                                      --%>
          <strong><form id="login" name="frm" method="post" action="validar_empleado.jsp">
                  <a href="#" id="flipToRecover" class="flipLink">Administrador?</a><br>
 				<input type="text" name="usuariop" id="loginEmail" placeholder="usuario "  required="required"/>
				<input type="password" name="clavep" id="loginPass" placeholder="password " required="required"  />
				<input type="submit" name="submit" value="Login" />
                <input name="tip_usup" type="hidden" value="ad">
              </form></strong> El SuperAdministrador es el personal autorizado para ingresar a este modulo.
               </span>
      </div>
    </div>
      <%--                                                      ^^^^^^^^^^^^^^^^^^                                                        --%>
    <div class="wrapper">
      <div class="item">
        <img src="images/chimpified.jpeg" />
        <span class="information">
             <%--                                       LOGIN DE OTROS TRABAJADOR                                                      --%>
          <strong><form id="login" method="post" action="validar_empleado.jsp">
				<a href="#" id="flipToRecover" class="flipLink">MP/Otras Areas</a>
                	        <select name="tip_usup" class="form-login">
                            <option value="mp">Mesa de Partes</option>
                            <option value="oa">Otra &Aacute;rea</option>
                        </select>
				<input type="text" name="usuariop" id="loginEmail" placeholder="usuario " required="required" />
                                <input type="password" name="clavep" id="loginPass" placeholder="password " required="required" />
                                <input type="submit" name="submit" value="Login"  />
			</form></strong> Personal encargado de la recepcion y la derivacion de tramites.
                </span>
      </div>
    </div>
     <%--                                       ^^^^^^^^^^^^^^^^^^                                                --%>
    <div class="wrapper">
      <div class="item">
        <img src="images/olark.png" />
        <span class="information">
             <%--                                       LOGIN CONSULTA TU TRAMITE                                                      --%>
          <strong><form id="login" name="Inicio_Sesion" method="post" action="usuario/InicSesion.jsp">
                  
				<a href="#" id="flipToRecover" class="flipLink">Consultar tramite?</a><br>
				<input type="text" name="usuario" id="loginEmail" placeholder="usuario " required="required" /><br>
				<input type="password" name="clave" id="loginPass" placeholder="password " required="required" />
				<input type="submit" name="" value="Login" />
			</form></strong> El usuario podra consultar el estado de su tramites en forme Online.
         </span>
      </div>
    </div>
         <%--                                       ^^^^^^^^^^^^^^^^^^                                                --%>
  </form>  
  <em><a href="http://www.subregionpacifico.gob.pe/?p=2551">&bull; Portal SubRegion &bull;</a></em>
  <span id="information" style="display:none">Your browser doesn't support CSS3 3D Transform</span>
  <script type="text/javascript" src="modernizr.custom.34807.js"></script>
  <script type="text/javascript">
    if(!Modernizr.csstransforms3d) document.getElementById('information').style.display = 'block';
  </script>
  <!-- GA -->
  <script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  </script>
  <script type="text/javascript">
    try {
      var pageTracker = _gat._getTracker("UA-2260508-2");
      pageTracker._trackPageview();
    } catch(err) {}</script>
  <!-- GA -->

    </body>
</html>
