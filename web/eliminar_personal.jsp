<%-- 
    Document   : eliminar_personal
    Created on : 19-jun-2012, 19:20:41
    Author     : miky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.personal" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    personal cPers= new personal();
    cPers.setDni(request.getParameter("id"));
    cPers.eliminar();
    response.sendRedirect("personal.jsp");
%>
