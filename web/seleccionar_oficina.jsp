<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="clases.oficina"%>
<%@ page import="clases.area"%>
<%@page import="java.util.*" %>
<%
    oficina cOfi= new oficina();
    cOfi.setCodigo_oficina(Integer.parseInt(request.getParameter("id")));
    cOfi.buscar();
    
    
%>
<form action="modificar_oficina.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">
                     <input name="cod" type="hidden" value="<% out.print(cOfi.getCodigo_oficina()); %>" />
			<label for="siglas">
				&nbsp;Área:
			</label>
			<br />
            <select name="area"class="combo" >
                <% area cArea= new area();
                    cArea.setCod_area(cOfi.getCod_area());
                    cArea.buscar();
                    int cod_area=cArea.getCod_area();
                %>
                <option value="<% out.print(cod_area); %>"><% out.print(cArea.getDescripcion()); %></option>
            <% 
               ArrayList<area> lArea= cArea.listar();
               Iterator iteratorA= lArea.iterator();
               while(iteratorA.hasNext()){
                 cArea=(area)iteratorA.next();
                 if(cod_area!=cArea.getCod_area()){
            %>
                 <option value="<% out.print(cArea.getCod_area()); %>"><% out.print(cArea.getDescripcion()); %></option>
              <% }} %>
            </select>

			<br />
			<label for="descripcion">
				&nbsp;Abreviatura:
			</label>
			<br />
			<input type="text" id="descripcion" name="abrev" size="30" value="<%out.print(cOfi.getAbrev());%>" class="inputbox" maxlength="100" />
			<br />
            <label for="descripcion">
				&nbsp;Descripción:
			</label>
			<br />
			<input type="text" id="descripcion" name="descripcion" size="30" value="<%out.print(cOfi.getDescripcion());%>" class="inputbox" maxlength="100" />
			<br />
			<label for="contact_subject">
				&nbsp;</label>
			<button class="button validate" type="submit">Guardar</button><b/> <button onclick="location.href='oficina.jsp'" class="button validate" type="button">Cancelar</button>

		</div>
	</form>