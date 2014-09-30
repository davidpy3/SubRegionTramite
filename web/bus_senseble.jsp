<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="clases.usuario" %>
<%@page import="clases.expediente" %>
<table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable">
		<thead>
			<tr>
				<th width="88" class="nosort"><h3>DNI</h3></th>
				<th width="250"><h3>Apellido y Nombre</h3></th>
				<th width="160"><h3>N&uacute;mero Expediente</h3></th>
			</tr>
		</thead>
		<tbody>
                    <% usuario cUsu= new usuario();
               ArrayList<usuario> lUsu= cUsu.listar(request.getParameter("id"));
               Iterator iteratorA= lUsu.iterator();
               while(iteratorA.hasNext()){
                 cUsu=(usuario)iteratorA.next();
				 expediente cEx= new expediente();
                            cEx.setDni(cUsu.getDni());
                            cEx.buscar();  %>
                            
			<tr>
                            <td style="font-size: 10px;"><a href="#" onclick="javascript:window.opener.document.frm2.nexp.value ='<% out.print(cEx.getN_expediente()); %>'"><% out.print(cUsu.getDni()); %></a></td>
                            <td style="font-size: 10px;"><% out.print(cUsu.getApelllido()+" "+cUsu.getNombre()); %></td>
			<td style="font-size: 10px;"><%
                            
                            out.print(cEx.getN_expediente());
                            %></td>
			</tr>
                 <% } %>
		</tbody>
  </table>
  <script type="text/javascript" src="style/script.js"></script>
	<script type="text/javascript">
  var sorter = new TINY.table.sorter("sorter");
	sorter.head = "head";
	sorter.asc = "asc";
	sorter.desc = "desc";
	sorter.even = "evenrow";
	sorter.odd = "oddrow";
	sorter.evensel = "evenselected";
	sorter.oddsel = "oddselected";
	sorter.paginate = true;
	sorter.currentid = "currentpage";
	sorter.limitid = "pagelimit";
	sorter.init("table",1);
  </script>