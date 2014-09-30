<%-- 
    Document   : menu
    Created on : 03-jun-2012, 22:16:42
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="clases.usuario" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%
        usuario usu= new usuario();
        String usuario=request.getParameter("usuario");
        String clave=request.getParameter("clave");
        usu.setUsuario(usuario);
        usu.setPassword(clave);
        int valor=usu.validar();
        if (valor==1){
            HttpSession op=request.getSession();
            op.putValue("varUsuario", usuario);
            response.sendRedirect("Menu.jsp");
        }else{
            response.sendRedirect("index.jsp");
        }
        %></h1>
    </body>
</html>
