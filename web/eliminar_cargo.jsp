<%-- 
    Document   : eliminar
    Created on : 19-jun-2012, 22:19:40
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.cargo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    cargo cCargo= new cargo();
    cCargo.setIdcargo(Integer.parseInt(request.getParameter("id")));
    cCargo.eliminar();
    response.sendRedirect("cargo.jsp");
%>
