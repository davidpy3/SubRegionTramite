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
public class area {
    private int  cod_area;
    private String siglas;
    private String descripcion;

    /**
     * @return the cod_area
     */
    public int getCod_area() {
        return cod_area;
    }

    /**
     * @param cod_area the cod_area to set
     */
    public void setCod_area(int cod_area) {
        this.cod_area = cod_area;
    }

    /**
     * @return the siglas
     */
    public String getSiglas() {
        return siglas;
    }

    /**
     * @param siglas the siglas to set
     */
    public void setSiglas(String siglas) {
        this.siglas = siglas;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void agregar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("insert into area(siglas,descripcion) values('"+ getSiglas() +"','"+ getDescripcion() +"')");
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
            s.executeUpdate("update area set siglas='"+ getSiglas() +"', descripcion='"+ getDescripcion() +"' where cod_area="+ getCod_area() +"");
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
            s.executeUpdate("delete from area where cod_area="+ getCod_area() +"");
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
            ResultSet rs = s.executeQuery ("SELECT * FROM `area` WHERE `cod_area`='"+ getCod_area() +"'");
            while (rs.next())
            {
                setSiglas(rs.getString(2));
                setDescripcion(rs.getString(3));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<area> listar(){
        ArrayList<area> lArea= new ArrayList<area>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `area` ");
            while (rs.next())
            {
                area a= new area();
                a.setCod_area(rs.getInt(1));
                a.setSiglas(rs.getString(2));
                a.setDescripcion(rs.getString(3));
                lArea.add(a);
            }
            con.close();
            return lArea;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }
}
