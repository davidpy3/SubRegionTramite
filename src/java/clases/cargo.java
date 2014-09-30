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
public class cargo {
    private int idcargo;
    private String nombre_cargo;
    private String abrev;
    private String estado;

    /**
     * @return the idcargo
     */
    public int getIdcargo() {
        return idcargo;
    }

    /**
     * @param idcargo the idcargo to set
     */
    public void setIdcargo(int idcargo) {
        this.idcargo = idcargo;
    }

    /**
     * @return the nombre_cargo
     */
    public String getNombre_cargo() {
        return nombre_cargo;
    }

    /**
     * @param nombre_cargo the nombre_cargo to set
     */
    public void setNombre_cargo(String nombre_cargo) {
        this.nombre_cargo = nombre_cargo;
    }

    /**
     * @return the abrev
     */
    public String getAbrev() {
        return abrev;
    }

    /**
     * @param abrev the abrev to set
     */
    public void setAbrev(String abrev) {
        this.abrev = abrev;
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

     public void agregar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `cargo`(`nombre_cargo`, `abrev`, `estado`) VALUES ('"+ getNombre_cargo() +"','"+ getAbrev() +"','"+ getEstado() +"')");
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
            s.executeUpdate("UPDATE `cargo` SET `nombre_cargo`='"+ getNombre_cargo() +"',`abrev`='"+ getAbrev() +"',`estado`='"+ getEstado() +"' WHERE `idcargo`=" + getIdcargo() +"");
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
            s.executeUpdate("DELETE FROM `cargo` WHERE `idcargo`="+getIdcargo());
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
            ResultSet rs = s.executeQuery ("SELECT * FROM `cargo` WHERE `idcargo`="+ getIdcargo() +"");
            while (rs.next())
            {
               setNombre_cargo(rs.getString(2));
               setAbrev(rs.getString(3));
               setEstado(rs.getString(4));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public ArrayList<cargo> listar(){
        ArrayList<cargo> lCargo= new ArrayList<cargo>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `cargo` ");
            while (rs.next())
            {
                cargo c= new cargo();
                c.setIdcargo(rs.getInt(1));
                c.setNombre_cargo(rs.getString(2));
                c.setAbrev(rs.getString(3));
                c.setEstado(rs.getString(4));
                lCargo.add(c);
            }
            con.close();
            return lCargo;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }
}
