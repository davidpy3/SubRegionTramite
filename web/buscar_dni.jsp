<%-- 
    Document   : buscar_dni
    Created on : 24-jun-2012, 19:05:20
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.usuario" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    usuario cUsu= new usuario();
    cUsu.setDni(request.getParameter("dni"));
    cUsu.getDni();
    int i=cUsu.buscarxdni();
    if(i==1)out.print("El usuario ya existe <a href='tramite.jsp?dni="+cUsu.getDni() +"'>¿desea crear un trámite?</a>");
%>