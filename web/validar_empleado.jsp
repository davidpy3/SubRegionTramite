<%-- 
    Document   : menu
    Created on : 03-jun-2012, 22:16:42
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="clases.personal" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
        personal usu= new personal();
        String tip_usu=request.getParameter("tip_usup");
        String usuario=request.getParameter("usuariop");
        String clave=request.getParameter("clavep");
        usu.setUsuario(usuario);
        usu.setPassword(clave);
        int valor=usu.validar(tip_usu);
        if (valor==1){
            HttpSession op=request.getSession();
            op.putValue("varUsuario"+tip_usu, usuario);
			out.print(tip_usu);
            if(tip_usu.equals("ad")){response.sendRedirect("Menu_Admin.jsp");}
            if(tip_usu.equals("mp")){response.sendRedirect("Menu_mesa_partes.jsp");}
            if(tip_usu.equals("oa")){response.sendRedirect("Menu_ot_area.jsp");}
        }else{
            response.sendRedirect("index.jsp");
        }
        %>