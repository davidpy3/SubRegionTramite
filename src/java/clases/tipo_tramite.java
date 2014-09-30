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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author miky
 */
public class tipo_tramite {
    private int idTipo_tramite;
    private String nombre;
    private String abrev;

    public int getIdTipo_tramite() {
        return idTipo_tramite;
    }

    public void setIdTipo_tramite(int idTipo_tramite) {
        this.idTipo_tramite = idTipo_tramite;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAbrev() {
        return abrev;
    }

    public void setAbrev(String abrev) {
        this.abrev = abrev;
    }

    public void agregar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `tipo_tramite`(`nombre`, `abrev`) VALUES ('"+ getNombre() +"','"+ getAbrev() +"')");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void modificar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("UPDATE `tipo_tramite` SET `nombre`='"+ getNombre() +"',`abrev`='"+ getAbrev() +"' WHERE `idTipo_tramite`="+ getIdTipo_tramite());
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
            s.executeUpdate("delete from tipo_tramite where `idTipo_tramite`="+ getIdTipo_tramite());
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
            ResultSet rs = s.executeQuery ("SELECT * FROM `tipo_tramite` WHERE `idTipo_tramite`="+getIdTipo_tramite());
            while (rs.next())
            {
                setNombre(rs.getString(2));
                setAbrev(rs.getString(3));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<tipo_tramite> listar(){
        ArrayList<tipo_tramite> lTipo_tramite= new ArrayList<tipo_tramite>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `tipo_tramite`");
            while (rs.next())
            {
                tipo_tramite tt= new tipo_tramite();
                tt.setIdTipo_tramite(rs.getInt(1));
                tt.setNombre(rs.getString(2));
                tt.setAbrev(rs.getString(3));
                lTipo_tramite.add(tt);
            }
            con.close();
            return lTipo_tramite;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

}
