<%-- 
    Document   : Cerrar_sesion
    Created on : 06-jun-2012, 21:34:04
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.getSession().removeAttribute("varUsuarioad");
    session.invalidate();
    response.setHeader("Cache-Control","no-store");
    response.sendRedirect("index.jsp");
%>
