<%-- 
    Document   : agregar_tip_t
    Created on : 19-jun-2012, 22:56:04
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.tipo_tramite" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    tipo_tramite cTip_t= new tipo_tramite();
    cTip_t.setNombre(request.getParameter("nom"));
    cTip_t.setAbrev(request.getParameter("abrev"));
    cTip_t.agregar();
    response.sendRedirect("tip_tramite.jsp");
%>

