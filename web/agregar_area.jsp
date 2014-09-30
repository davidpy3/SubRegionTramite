<%-- 
    Document   : agregar_area
    Created on : 17-jun-2012, 15:21:19
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.area" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    area cArea= new area();
    cArea.setSiglas(request.getParameter("siglas"));
    cArea.setDescripcion(request.getParameter("descripcion"));
    cArea.agregar();
    response.sendRedirect("Menu_Admin.jsp");
%>
