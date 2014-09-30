<%-- 
    Document   : agregar_cargo
    Created on : 19-jun-2012, 22:15:00
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.cargo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    cargo cCargo= new cargo();
    cCargo.setNombre_cargo(request.getParameter("nom"));
    cCargo.setAbrev(request.getParameter("abrev"));
    cCargo.setEstado(request.getParameter("estado"));
    cCargo.agregar();
    response.sendRedirect("cargo.jsp");
%>

