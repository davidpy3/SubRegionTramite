<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.oficina" %>
<%@page import="java.util.*" %>
 <select name="oficina" id="oficina" size="1">
    <%
        int id=Integer.parseInt(request.getParameter("id"));
            oficina cOfic= new oficina();
            ArrayList<oficina> lOficina= cOfic.listar_x_area(id);
              Iterator iteratorOficina= lOficina.iterator();
              while(iteratorOficina.hasNext()){
                 cOfic=(oficina)iteratorOficina.next();
			%>
                        <option value="<% out.print(cOfic.getCodigo_oficina()); %>"><% out.print(cOfic.getDescripcion()); %></option>
               <% } %>
 </select>