<%-- 
    Document   : eliminar_tip_t
    Created on : 19-jun-2012, 23:05:03
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.tipo_tramite" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    tipo_tramite cTip_t= new tipo_tramite();
    cTip_t.setIdTipo_tramite(Integer.parseInt(request.getParameter("id")));
    cTip_t.eliminar();
    response.sendRedirect("tip_tramite.jsp");
%>
