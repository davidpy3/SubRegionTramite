<%--
    Document   : registrar_usuario
    Created on : 22-jun-2012, 22:01:19
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.tramite" %>
<%@page import="clases.tramite_movimiento" %>
<%@page import="java.util.*" %>
<%
    tramite cTra= new tramite();
    tramite_movimiento cTm= new tramite_movimiento();
    cTra.setTip_tram(Integer.parseInt(request.getParameter("tipt")));
    cTra.setN_expeiente(Integer.parseInt(request.getParameter("nexp")));
    Calendar c2 = new GregorianCalendar();
    int anio=c2.get(Calendar.YEAR);
    cTra.setA_eje(anio);
    cTra.setAsunto(request.getParameter("asunto"));
    cTra.setReferencia(request.getParameter("refere"));
    cTra.setDetalle(request.getParameter("detalle"));
    cTra.setObservaciones(request.getParameter("observa"));
    cTra.agregar(request.getParameter("fecha"));
    int tra=cTra.buscar_ultimoT();

    cTm.setTramite(tra);
    //modificar el codigo de oficina de mesa partes
    cTm.setCod_oficina(1);
    cTm.setPrioridad("ninguna");
    cTm.setA_eje(String.valueOf(anio));
    cTm.setEstado("p");
    cTm.agregar(request.getParameter("fecha"));

    response.sendRedirect("Menu_mesa_partes.jsp?dni=");
%>
