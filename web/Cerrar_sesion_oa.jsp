<%-- 
    Document   : Cerrar_sesion
    Created on : 06-jun-2012, 21:34:04
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.getSession().removeAttribute("varUsuariooa");
    session.invalidate();
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.sendRedirect("index.jsp");
%>
