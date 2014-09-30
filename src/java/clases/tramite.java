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
public class tramite {
    private int n_tramite;
    private int tip_tram;
    private int n_expeiente;
    private int a_eje;
    private Date fecha;
    private String asunto;
    private String detalle;
    private String observaciones;
    private String referencia;
    
    public int getN_tramite() {
        return n_tramite;
    }

    public void setN_tramite(int n_tramite) {
        this.n_tramite = n_tramite;
    }

    public int getTip_tram() {
        return tip_tram;
    }

    public void setTip_tram(int tip_tram) {
        this.tip_tram = tip_tram;
    }

    public int getN_expeiente() {
        return n_expeiente;
    }

    public void setN_expeiente(int n_expeiente) {
        this.n_expeiente = n_expeiente;
    }

    public int getA_eje() {
        return a_eje;
    }

    public void setA_eje(int a_eje) {
        this.a_eje = a_eje;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }


    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

     public void agregar(String fecha){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `tramite`(`tip_tram`, `n_expediente`, `a_eje`, `fecha`, `asunto`, `referencia`, `detalle`, `observaciones`) " +
                    "VALUES ("+ getTip_tram() +","+ getN_expeiente() +","+ getA_eje() +",'"+ fecha +"','"+ getAsunto() +"','"+ getReferencia() +"','"+ getDetalle() +"','"+ getObservaciones() +"')");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public int buscar_ultimoT(){
         int i=0;
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT max(n_tramite) FROM `tramite` WHERE `n_expediente`="+ getN_expeiente());
            while (rs.next())
            {
                i=rs.getInt(1);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    public void buscar(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite` WHERE `n_tramite`="+ getN_tramite());
            while (rs.next())
            {
                setN_tramite(rs.getInt(1));
                setTip_tram(rs.getInt(2));
                setA_eje(rs.getInt(4));
                setFecha(rs.getDate(5));
                setAsunto(rs.getString(6));
                setReferencia(rs.getString(7));
                setDetalle(rs.getString(8));
                setObservaciones(rs.getString(9));
            }
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
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite` WHERE `n_expediente`="+ getN_expeiente() +" ORDER BY  `n_tramite` DESC LIMIT 0,1 ");
            while (rs.next())
            {
                setN_tramite(rs.getInt(1));
                setTip_tram(rs.getInt(2));
                setA_eje(rs.getInt(4));
                setFecha(rs.getDate(5));
                setAsunto(rs.getString(6));
                setReferencia(rs.getString(7));
                setDetalle(rs.getString(8));
                setObservaciones(rs.getString(9));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public int cantidad_tramite(){
        int cant=0;
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT count(`n_expediente`) FROM `tramite` WHERE `n_expediente`="+ getN_expeiente());
            while (rs.next())
            {
                cant=rs.getInt(1);
                
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cant;
    }

     public ArrayList<tramite> listar(){
        ArrayList<tramite> lTramite= new ArrayList<tramite>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tramite` WHERE `n_expediente`="+ getN_expeiente() );
            while (rs.next())
            {
                tramite t= new tramite();
                t.setN_tramite(rs.getInt(1));
                t.setTip_tram(rs.getInt(2));
                t.setN_expeiente(rs.getInt(3));
                t.setA_eje(rs.getInt(4));
                t.setFecha(rs.getDate(5));
                t.setAsunto(rs.getString(6));
                t.setReferencia(rs.getString(7));
                t.setDetalle(rs.getString(8));
                t.setObservaciones(rs.getString(9));
                lTramite.add(t);
            }
            con.close();
            return lTramite;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

}
