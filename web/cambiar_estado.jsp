<%-- 
    Document   : cambiar_estado
    Created on : 21-jun-2012, 20:31:50
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.tramite_movimiento" %>
<%
    tramite_movimiento cTram= new tramite_movimiento();
    int id=Integer.parseInt( request.getParameter("id"));
    cTram.setTramite(id);
    cTram.cambiar_estado();
    out.print(id);
%>
