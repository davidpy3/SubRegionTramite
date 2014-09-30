<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>buscar_usu</title>
<link rel="stylesheet" href="style/style.css" />
</head>
<body>
<div align="center">Buscar Usuario:<input type="text" />
</div>
<div id="controls" align="center">
  <div id="perpage">
        <select onchange="sorter.size(this.value)">
			<option value="5">5</option>
				<option value="10" selected="selected">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
	</select>
			<span>por p&aacute;gina</span>
  </div>
		<div id="navigation">
		  <img src="style/image/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
		  <img src="style/image/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
		  <img src="style/image/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
		  <img src="style/image/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
		</div>
		<div id="text">Viendo la p&aacute;gina  <span id="currentpage"></span> de <span id="pagelimit"></span></div>
	</div>
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
               ArrayList<usuario> lUsu= cUsu.listar();
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
</body>
</html>