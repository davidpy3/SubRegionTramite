<%-- 
    Document   : modificar_area
    Created on : 17-jun-2012, 19:29:22
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.area" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    area cArea= new area();
    cArea.setCod_area(Integer.parseInt(request.getParameter("cod")));
    cArea.setSiglas(request.getParameter("siglas"));
    cArea.setDescripcion(request.getParameter("descripcion"));
    cArea.modificar();
    response.sendRedirect("Menu_Admin.jsp");
%>