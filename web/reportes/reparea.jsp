<%-- 
    Document   : reparea
    Created on : 27-jun-2012, 22:06:18
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
/*importamos las librerías de JasperReports*/
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
/*Parametros para realizar la conexión*/
Connection conexion;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conexion = DriverManager.getConnection("jdbc:mysql://localhost/stdsrp","root","");
/*Establecemos la ruta del reporte*/
File reportFile = new File(application.getRealPath("reportes//area.jasper"));
/* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/
Map parameters = new HashMap();
parameters.put("id","");
/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion);
/*Indicamos que la respuesta va a ser en formato PDF*/
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream = response.getOutputStream();
ouputStream.write(bytes, 0, bytes.length);
/*Limpiamos y cerramos flujos de salida*/
ouputStream.flush();
ouputStream.close();
%>