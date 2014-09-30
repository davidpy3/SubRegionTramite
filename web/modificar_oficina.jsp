<%-- 
    Document   : modificar_oficina
    Created on : 18-jun-2012, 23:22:14
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.oficina" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    oficina cOfi= new oficina();
    cOfi.setCodigo_oficina(Integer.parseInt(request.getParameter("cod")));
    cOfi.setCod_area(Integer.parseInt(request.getParameter("area")));
    cOfi.setAbrev(request.getParameter("abrev"));
    cOfi.setDescripcion(request.getParameter("descripcion"));
    cOfi.modificar();
    response.sendRedirect("oficina.jsp");
%>
