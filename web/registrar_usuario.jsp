<%-- 
    Document   : registrar_usuario
    Created on : 22-jun-2012, 22:01:19
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.usuario" %>
<%@page import="clases.expediente" %>
<%
    usuario cUsu= new usuario();
    expediente cExp= new expediente();
    cUsu.setDni(request.getParameter("dni"));
    cUsu.setNombre(request.getParameter("nombre"));
    cUsu.setApelllido(request.getParameter("ape"));
    cUsu.setUsuario(request.getParameter("usuario"));
    cUsu.setPassword(request.getParameter("clave"));
    cUsu.agregar();
    cExp.setDni(cUsu.getDni());
    cExp.setDescripcion(request.getParameter("descrip"));
    cExp.agregar();
    response.sendRedirect("tramite.jsp?dni="+cUsu.getDni());
%>
