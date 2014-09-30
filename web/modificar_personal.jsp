<%-- 
    Document   : modificar_personal
    Created on : 19-jun-2012, 20:39:05
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.personal" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat;" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    personal cPersonal= new personal();
    cPersonal.setDni(request.getParameter("dni"));
    cPersonal.setCod_oficina(Integer.parseInt(request.getParameter("oficina")));
    cPersonal.setIdCargo(Integer.parseInt(request.getParameter("cargo")));
    cPersonal.setUsuario(request.getParameter("usuario"));
    cPersonal.setPassword(request.getParameter("clave"));
    cPersonal.setApellidoPaterno(request.getParameter("pPater"));
    cPersonal.setApellidoMaterno(request.getParameter("pMater"));
    cPersonal.setNombres(request.getParameter("nom"));

    cPersonal.setSexo(request.getParameter("sex"));
    cPersonal.setTelefono(request.getParameter("telef"));
    cPersonal.setDomicilio(request.getParameter("domicilio"));
    cPersonal.setEmail(request.getParameter("email"));
    cPersonal.setEstado(request.getParameter("estado"));
    cPersonal.setTip_usu(request.getParameter("tip_usu"));
    cPersonal.modificar(request.getParameter("fecha"));
    response.sendRedirect("personal.jsp");
%>