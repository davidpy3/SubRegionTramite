<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="clases.tipo_tramite"%>
<%
    tipo_tramite cTip_t= new tipo_tramite();
    cTip_t.setIdTipo_tramite(Integer.parseInt(request.getParameter("id")));
    cTip_t.buscar();
%>
<form action="modificar_tip_t.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
                    <input name="cod" type="hidden" value="<% out.print(cTip_t.getIdTipo_tramite()); %>" />
			<label for="nom">
				&nbsp;Nombre:
			</label>
			<br />
			<input type="text" name="nom" id="nom" size="30" class="inputbox" value="<% out.print(cTip_t.getNombre()); %>" />
			<br />
			<label for="abrev">
				&nbsp;Abreviatura:
			</label>
			<br />
			<input type="text" id="abrev" name="abrev" size="30" value="<% out.print(cTip_t.getAbrev()); %>" class="inputbox" maxlength="100" />
			<br />
			<label for="contact_subject">
				&nbsp;</label>
			<button class="button validate" type="submit">Guardar</button>
                        <b/> <button onclick="location.href='tip_tramite.jsp'" class="button validate" type="button">Cancelar</button>

		</div>
	</form>