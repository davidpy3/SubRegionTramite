<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="clases.area"%>
<%
    area cArea= new area();
    cArea.setCod_area(Integer.parseInt(request.getParameter("id")));
    cArea.buscar();
%>
<form action="modificar_area.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
        <input name="cod" type="hidden" value="<% out.print(cArea.getCod_area()); %>" />
			<label for="siglas">
				&nbsp;Siglas:
			</label>
			<br />
                        <input type="text" name="siglas" id="siglas" size="30" class="inputbox" value="<% out.print(cArea.getSiglas()); %>" />
			<br />
			<label for="descripcion">
				&nbsp;Descripción:
			</label>
			<br />
			<input type="text" id="descripcion" name="descripcion" size="30" value="<% out.print(cArea.getDescripcion()); %>" class="inputbox" maxlength="100" />
			<br />
			<label for="contact_subject">
				&nbsp;</label>
			<button class="button validate" type="submit">Guardar</button> <b/> <button onclick="location.href='Menu_Admin.jsp'" class="button validate" type="button">Cancelar</button>
			      <br /><br />
			
		</div>
	</form>