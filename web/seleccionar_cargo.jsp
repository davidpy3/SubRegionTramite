<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="clases.cargo"%>
<%
    cargo cCargo= new cargo();
    cCargo.setIdcargo(Integer.parseInt(request.getParameter("id")));
    cCargo.buscar();
%>
<form action="modificar_cargo.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
                    <input name="cod" type="hidden" value="<% out.print(cCargo.getIdcargo()); %>" />
			<p>
			  <label for="nom">
			    &nbsp;Nombre Cargo:
			    </label>
			  <br />
                          <input type="text" name="nom" id="nom" size="30" class="inputbox" value="<% out.print(cCargo.getNombre_cargo()); %>" />
			  <br />
			  <label for="abrev">
			    &nbsp;Abreviatura:
			    </label>
			  <br />
			  <input type="text" id="abrev" name="abrev" size="30" value="<% out.print(cCargo.getAbrev()); %>" class="inputbox" maxlength="100" />
			  </p>
			<p>
			  <label for="estado">Estado: </label>
              <br />
              <input type="text" id="estado" name="estado" size="30" value="<% out.print(cCargo.getEstado()); %>" class="inputbox" maxlength="100" />
<br />
			  <label for="contact_subject">
			    &nbsp;</label>
			  </p>
			<button class="button validate" type="submit">Guardar</button>
                        <b/> <button onclick="location.href='cargo.jsp'" class="button validate" type="button">Cancelar</button>

		</div>
	</form>
