<%-- 
    Document   : eliminar_oficina
    Created on : 18-jun-2012, 23:25:49
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.oficina" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    oficina cOfi= new oficina();
    cOfi.setCodigo_oficina(Integer.parseInt(request.getParameter("id")));
    cOfi.eliminar();
    response.sendRedirect("oficina.jsp");
%>
