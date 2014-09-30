<%-- 
    Document   : agregar_oficina
    Created on : 18-jun-2012, 22:33:01
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.oficina" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    oficina cOfi= new oficina();
    cOfi.setCod_area(Integer.parseInt(request.getParameter("area")));
    cOfi.setAbrev(request.getParameter("abrev"));
    cOfi.setDescripcion(request.getParameter("descripcion"));
    cOfi.agregar();
    response.sendRedirect("oficina.jsp");
%>