<%-- 
    Document   : derivar
    Created on : 21-jun-2012, 21:55:25
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.tramite_movimiento"%>
<%@page import="java.util.*"%>
<%

    Calendar c2 = new GregorianCalendar();
    int anio=c2.get(Calendar.YEAR);
    int mes=c2.get(Calendar.MONTH)+1;
    int dia=c2.get(Calendar.DATE);
    tramite_movimiento cTram= new tramite_movimiento();
    int id=Integer.parseInt(request.getParameter("id"));
    int ofi=Integer.parseInt(request.getParameter("ofi"));
    String prio=request.getParameter("prio");
    cTram.setTramite(id);
    cTram.cambiar_estado();
    cTram.setCod_oficina(ofi);
    String fecha=anio+"-"+mes+"-"+ dia;
    cTram.setPrioridad(prio);
    cTram.setA_eje(String.valueOf(anio));
    cTram.setEstado("p");
    cTram.agregar(fecha);

%>
