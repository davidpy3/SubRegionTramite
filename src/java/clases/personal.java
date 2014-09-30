/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
*/
package clases;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author miky
 */
public class personal {
    private String dni;
    private int cod_oficina;
    private int idCargo;
    private String usuario;
    private String password;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String nombres;
    private Date fecha_nac;
    private String sexo;
    private String telefono;
    private String domicilio;
    private String email;
    private String estado;
    private String tip_usu;
    /**
     * @return the dni
     */
    public String getDni() {
        return dni;
    }
    /**
     * @param dni the dni to set
     */
    public void setDni(String dni) {
        this.dni = dni;
    }
    /**
     * @return the cod_oficina
     */
    public int getCod_oficina() {
        return cod_oficina;
    }
    /**
     * @param cod_oficina the cod_oficina to set
     */
    public void setCod_oficina(int cod_oficina) {
        this.cod_oficina = cod_oficina;
    }
    /**
     * @return the idCargo
     */
    public int getIdCargo() {
        return idCargo;
    }
    /**
     * @param idCargo the idCargo to set
     */
    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }
    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }
    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * @return the apellidoPaterno
     */
    public String getApellidoPaterno() {
        return apellidoPaterno;
    }
    /**
     * @param apellidoPaterno the apellidoPaterno to set
     */
    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }
    /**
     * @return the apellidoMaterno
     */
    public String getApellidoMaterno() {
        return apellidoMaterno;
    }
    /**
     * @param apellidoMaterno the apellidoMaterno to set
     */
    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }
    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }
    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    /**
     * @return the fecha_nac
     */
    public Date getFecha_nac() {
        return fecha_nac;
    }
    /**
     * @param fecha_nac the fecha_nac to set
     */
    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }
    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }
    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }
    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    /**
     * @return the domicilio
     */
    public String getDomicilio() {
        return domicilio;
    }
    /**
     * @param domicilio the domicilio to set
     */
    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }
    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
    /**
     * @return the tip_usu
     */
    public String getTip_usu() {
        return tip_usu;
    }
    /**
     * @param tip_usu the tip_usu to set
     */
    public void setTip_usu(String tip_usu) {
        this.tip_usu = tip_usu;
    }
    public void agregar(String fech){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `personal`VALUES ('"+ getDni() +"',"+ getCod_oficina() +","+ getIdCargo() +",'"+ getUsuario() +"','"+ getPassword() +"','"+ getApellidoPaterno() +"','"+ getApellidoMaterno() +"','"+ getNombres() +"','"+ fech +"','"+ getSexo() +"','"+ getTelefono() +"','"+ getDomicilio() +"','"+ getEmail() +"','"+ getEstado() +"','"+ getTip_usu() +"')");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void modificar(String fech){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("UPDATE `personal` SET `cod_oficina`="+ getCod_oficina() +",`idcargo`="+ getIdCargo() +" ,`usuario_sis`='"+ getUsuario() +"',`pass_sis`='"+ getPassword() +"',`apellidop`='"+ getApellidoPaterno() +"',`apellidom`='"+ getApellidoMaterno() +"',`nombres`='"+ getNombres() +"',`fecha_nac`='"+ fech +"',`sexo`='"+ getSexo() +"',`telefono`='"+ getTelefono() +"',`domicilio`='"+ getDomicilio() +"',`email`='"+ getEmail() +"',`estado`='"+ getEstado() +"',`tip_usu`='"+ getTip_usu() +"' WHERE `DNI`='"+ getDni() +"'");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void eliminar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("DELETE FROM `personal` WHERE `DNI`="+ getDni() +"");
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int validar(String tUsu){
        int verificar=0;
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT count(`usuario_sis`) FROM `personal` WHERE `usuario_sis`='"+ getUsuario() +"' and `pass_sis`='"+ getPassword() +"' and `tip_usu`='"+ tUsu +"' ");
            while (rs.next())
            {
                verificar=rs.getInt (1);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return verificar;
    }
    public void buscardni(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM  `personal` WHERE `dni` =  '"+ getDni() +"'");
            while (rs.next())
            {
                setDni(rs.getString(1));
                setCod_oficina(rs.getInt(2));
                setIdCargo(rs.getInt(3));
                setUsuario(rs.getString(4));
                setPassword(rs.getString(5));
                setApellidoPaterno(rs.getString(6));
                setApellidoMaterno(rs.getString(7));
                setNombres(rs.getString(8));
                setFecha_nac(rs.getDate(9));
                setSexo(rs.getString(10));
                setTelefono(rs.getString(11));
                setDomicilio(rs.getString(12));
                setEmail(rs.getString(13));
                setEstado(rs.getString(14));
                setTip_usu(rs.getString(15));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    public void buscar(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM  `personal` WHERE `usuario_sis` =  '"+ getUsuario() +"'");
            while (rs.next())
            {
                setDni(rs.getString(1));
                setCod_oficina(rs.getInt(2));
                setIdCargo(rs.getInt(3));
                setUsuario(rs.getString(4));
                setPassword(rs.getString(5));
                setApellidoPaterno(rs.getString(6));
                setApellidoMaterno(rs.getString(7));
                setNombres(rs.getString(8));
                setFecha_nac(rs.getDate(9));
                setSexo(rs.getString(10));
                setTelefono(rs.getString(11));
                setDomicilio(rs.getString(12));
                setEmail(rs.getString(13));
                setEstado(rs.getString(14));
                setTip_usu(rs.getString(15));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    public ArrayList<personal> listar(){
        ArrayList<personal> lPersonal= new ArrayList<personal>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `personal` ");
            while (rs.next())
            {
                personal p= new personal();
                p.setDni(rs.getString(1));
                p.setCod_oficina(rs.getInt(2));
                p.setIdCargo(rs.getInt(3));
                p.setUsuario(rs.getString(4));
                p.setPassword(rs.getString(5));
                p.setApellidoPaterno(rs.getString(6));
                p.setApellidoMaterno(rs.getString(7));
                p.setNombres(rs.getString(8));
                p.setFecha_nac(rs.getDate(9));
                p.setSexo(rs.getString(10));
                p.setTelefono(rs.getString(11));
                p.setDomicilio(rs.getString(12));
                p.setEmail(rs.getString(13));
                p.setEstado(rs.getString(14));
                p.setTip_usu(rs.getString(15));
                lPersonal.add(p);
            }
            con.close();
            return lPersonal;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }
    }
}
