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
public class tramite_movimiento {
    private int tramite;
    private int cod_oficina;
    private Date fechaEnvio;
    private Date fechaRecepcion;
    private String prioridad;
    private String a_eje;
    private String estado;

    public int getTramite() {
        return tramite;
    }

    public void setTramite(int tramite) {
        this.tramite = tramite;
    }

    public int getCod_oficina() {
        return cod_oficina;
    }

    public void setCod_oficina(int cod_oficina) {
        this.cod_oficina = cod_oficina;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public Date getFechaRecepcion() {
        return fechaRecepcion;
    }

    public void setFechaRecepcion(Date fechaRecepcion) {
        this.fechaRecepcion = fechaRecepcion;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getA_eje() {
        return a_eje;
    }

    public void setA_eje(String a_eje) {
        this.a_eje = a_eje;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void cambiar_estado(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("UPDATE `tramite_mov` SET `estado`='e' WHERE `trami`= "+getTramite());
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void agregar(String fecha){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `tramite_mov`(`trami`, `cod_oficina`, `fecha_envio`, `fecha_recepcion`, `prioridad`, `a_eje`, `estado`) VALUES ("+ getTramite() +","+ getCod_oficina()+",'"+ fecha +"','"+ fecha +"','"+ getPrioridad() +"','"+ getA_eje() +"','"+ getEstado() +"')");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void buscar_ultimo(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite_mov` WHERE `trami`="+ getTramite() +" order by `fecha_recepcion` desc limit 0,1 ");
            while (rs.next())
            {
                setCod_oficina(rs.getInt(2));
                setFechaEnvio(rs.getDate(3));
                setFechaRecepcion(rs.getDate(4));
                setPrioridad(rs.getString(5));
                setA_eje(rs.getString(6));
                setEstado(rs.getString(7));

            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



     public ArrayList<tramite_movimiento> listar(){
        ArrayList<tramite_movimiento> lTramiteMovimiento= new ArrayList<tramite_movimiento>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite_mov` where trami="+ getTramite() );
            while (rs.next())
            {
                tramite_movimiento tm= new tramite_movimiento();
                tm.setTramite(rs.getInt(1));
                tm.setCod_oficina(rs.getInt(2));
                tm.setFechaEnvio(rs.getDate(3));
                tm.setFechaRecepcion(rs.getDate(4));
                tm.setPrioridad(rs.getString(5));
                tm.setA_eje(rs.getString(6));
                tm.setEstado(rs.getString(7));
                lTramiteMovimiento.add(tm);
            }
            con.close();
            return lTramiteMovimiento;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

     public ArrayList<tramite_movimiento> listar_x_oficina_s(){
        ArrayList<tramite_movimiento> lTramiteMovimiento= new ArrayList<tramite_movimiento>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite_mov` WHERE `cod_oficina`="+ getCod_oficina() +" and estado='e' order by fecha_envio desc");
            while (rs.next())
            {
                tramite_movimiento tm= new tramite_movimiento();
                tm.setTramite(rs.getInt(1));
                tm.setCod_oficina(rs.getInt(2));
                tm.setFechaEnvio(rs.getDate(3));
                tm.setFechaRecepcion(rs.getDate(4));
                tm.setPrioridad(rs.getString(5));
                tm.setA_eje(rs.getString(6));
                tm.setEstado(rs.getString(7));
                lTramiteMovimiento.add(tm);
            }
            con.close();
            return lTramiteMovimiento;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

     }

     public ArrayList<tramite_movimiento> listar_x_oficina(){
        ArrayList<tramite_movimiento> lTramiteMovimiento= new ArrayList<tramite_movimiento>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite_mov` WHERE `cod_oficina`="+ getCod_oficina() +" and estado='p' order by fecha_envio desc");
            while (rs.next())
            {
                tramite_movimiento tm= new tramite_movimiento();
                tm.setTramite(rs.getInt(1));
                tm.setCod_oficina(rs.getInt(2));
                tm.setFechaEnvio(rs.getDate(3));
                tm.setFechaRecepcion(rs.getDate(4));
                tm.setPrioridad(rs.getString(5));
                tm.setA_eje(rs.getString(6));
                tm.setEstado(rs.getString(7));
                lTramiteMovimiento.add(tm);
            }
            con.close();
            return lTramiteMovimiento;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }
}
