<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="clases.personal"%>
<%@ page import="clases.oficina"%>
<%@ page import="clases.cargo"%>
<%@ page import="java.util.*"%>
<%
    personal cPersonal= new personal();
    cPersonal.setDni(request.getParameter("id"));
    cPersonal.buscardni();
%>
<form action="modificar_personal.jsp" method="post" name="emailForm" id="emailForm" class="form-validate">
		<div class="contact_email">

<br />

		</div>
        <table width="607" border="0">
  <tr>
    <td width="53"><label for="nom">DNI: </label></td>
    <td width="246"><input type="text" id="descripcion2" name="dni" size="30" value="<% out.print(cPersonal.getDni()); %>" class="inputbox" maxlength="8" /></td>
    <td width="40">&nbsp;</td>
    <td width="250">&nbsp;</td>
  </tr>
  <tr>
    <td><label for="telef">&nbsp;Oficina: </label></td>
    <td><select name="oficina"class="combo" id="oficina" >
            <%
            oficina cOfic= new oficina();
            int codofi=cPersonal.getCod_oficina();
            cOfic.setCodigo_oficina(codofi);
            cOfic.buscar();
            %>
            <option value="<% out.print(cOfic.getCodigo_oficina()); %>"><% out.print(cOfic.getDescripcion()); %></option>
            <%
              ArrayList<oficina> lOficina= cOfic.listar();
              Iterator iteratorOficina= lOficina.iterator();
              while(iteratorOficina.hasNext()){
                 cOfic=(oficina)iteratorOficina.next();
                 if(cOfic.getCodigo_oficina()!=codofi){
			%>
                        <option value="<% out.print(cOfic.getCodigo_oficina()); %>"><% out.print(cOfic.getDescripcion()); %></option>
               <% }} %>
            </select></td>
    <td>Cargo:</td>
    <td><select name="cargo"class="combo" id="cargo" >
            <%
            cargo cCargo= new cargo();
            int codcargo=cPersonal.getIdCargo();
            cCargo.setIdcargo(codcargo);
            cCargo.buscar();
            %>
            <option value="<% out.print(cCargo.getIdcargo()); %>"><% out.print(cCargo.getNombre_cargo()); %></option>
            <%
            ArrayList<cargo> lcargo= cCargo.listar();
              Iterator iteratorCargo= lcargo.iterator();
              while(iteratorCargo.hasNext()){
                 cCargo=(cargo)iteratorCargo.next();
                 if(cCargo.getIdcargo()!=codcargo){
			%>
                        <option value="<% out.print(cCargo.getIdcargo()); %>"><% out.print(cCargo.getNombre_cargo()); %></option>
               <% }} %>
    </select></td>
  </tr>
  <tr>
    <td>Usuario:</td>
    <td><input type="text" id="usuario" name="usuario" size="30" value="<% out.print(cPersonal.getUsuario()); %>"maxlength="12" /></td>
    <td>Clave:</td>
    <td><input type="password" id="descripcion4" name="clave" size="30" value="<% out.print(cPersonal.getPassword()); %>" class="inputbox" maxlength="12" /></td>
  </tr>
  <tr>
    <td>Ap. Paterno:</td>
    <td><input type="text" id="descripcion5" name="pPater" size="30" value="<% out.print(cPersonal.getApellidoPaterno()); %>"maxlength="20" onkeyup="this.value=this.value.toUpperCase()" /></td>
    <td>Ap. Materno:</td>
    <td><input type="text" id="descripcion3" name="pMater" size="30" value="<% out.print(cPersonal.getApellidoMaterno()); %>"maxlength="20" onkeyup="this.value=this.value.toUpperCase()" /></td>
  </tr>
  <tr>
    <td>Nombre:</td>
    <td colspan="3"><input type="text" id="descripcion6" name="nom" size="50" value="<% out.print(cPersonal.getNombres()); %>"maxlength="30" onkeyup="this.value=this.value.toUpperCase()" /></td>
    </tr>
  <tr>
    <td>Fecha Nac:</td>
    <td><input name="fecha" type="text" id="descripcion7" value="<% out.print(cPersonal.getFecha_nac()); %>" size="30"maxlength="12" /></td>
    <td>Sexo:</td>
    <td><input name="sex" type="radio" id="radio" value="M" <% if(cPersonal.getSexo().equals("M") ){ %>checked='checked'<% } %> />
      <label for="">Masculino </label><input name="sex" type="radio" value="F" <% if(cPersonal.getSexo().equals("F") ){ %>checked='checked'<% } %> />
      Femenino</td>
  </tr>
  <tr>
    <td>Domicilio:</td>
    <td colspan="3"><input type="text" id="descripcion8" name="domicilio" size="50" value="<% out.print(cPersonal.getDomicilio()); %>"maxlength="50" /></td>
    </tr>
  <tr>
    <td>Telefono:</td>
    <td><input name="telef" type="text" id="descripcion9" value="<% out.print(cPersonal.getTelefono()); %>" size="30"maxlength="12" /></td>
    <td>Email:</td>
    <td><input name="email" type="text" id="descripcion10" value="<% out.print(cPersonal.getEmail()); %>" size="30"maxlength="30" /></td>
  </tr>
  <tr>
    <td>Estado.</td>
    <td><input name="estado" type="text" id="descripcion11" value="<% out.print(cPersonal.getEstado()); %>" size="15"maxlength="4" /></td>
    <td>Tipo Usuario:<% out.print(cPersonal.getTip_usu()); %></td>
    <td><select name="tip_usu"class="combo" id="tip_usu" >
      <%
        if (cPersonal.getTip_usu().equals("mp")){
            %>
         <option value="mp">Mesa de Partes</option>
        <option value="oa">Otra &Aacute;rea</option>
        <option value="ad">Admnistrador</option>
       <%
            }
      %>
        <%
        if (cPersonal.getTip_usu().equals("oa")){
            %>
         <option value="oa">Otra &Aacute;rea</option>
            <option value="mp">Mesa de Partes</option>
        <option value="ad">Admnistrador</option>
       <%
            }
      %>
      <%
        if (cPersonal.getTip_usu().equals("ad")){
            %>
         <option value="ad">Admnistrador</option> 
            <option value="mp">Mesa de Partes</option>
            <option value="oa">Otra &Aacute;rea</option>
       <%
            }
      %>
    </select></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<button class="button validate" type="submit">Guardar</button><b/>
<button onclick="location.href='personal.jsp'" class="button validate" type="button">Cancelar</button>
	</form>