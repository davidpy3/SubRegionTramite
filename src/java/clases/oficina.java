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
public class oficina {
    private int codigo_oficina;
    private int cod_area;
    private String abrev;
    private String descripcion;

    /**
     * @return the codigo_oficina
     */
    public int getCodigo_oficina() {
        return codigo_oficina;
    }

    /**
     * @param codigo_oficina the codigo_oficina to set
     */
    public void setCodigo_oficina(int codigo_oficina) {
        this.codigo_oficina = codigo_oficina;
    }

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
            s.executeUpdate("INSERT INTO `oficinas`(`cod_area`, `abrev`, `descripcion`) VALUES ("+ getCod_area() +",'"+ getAbrev() +"','"+ getDescripcion() +"')");
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
            s.executeUpdate("UPDATE `oficinas` SET `cod_area`="+ getCod_area() +",`abrev`='"+ getAbrev() +"',`descripcion`='"+ getDescripcion() +"' WHERE `cod_oficina`="+ getCodigo_oficina());
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
            s.executeUpdate("delete from oficinas where cod_oficina="+ getCodigo_oficina() +"");
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<oficina> listar(){
        ArrayList<oficina> lOfi= new ArrayList<oficina>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `oficinas` ");
            while (rs.next())
            {
                oficina o= new oficina();
                o.setCodigo_oficina(rs.getInt(1));
                o.setCod_area(rs.getInt(2));
                o.setAbrev(rs.getString(3));
                o.setDescripcion(rs.getString(4));
                lOfi.add(o);
            }
            con.close();
            return lOfi;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

    public ArrayList<oficina> listar_x_area(int id){
        ArrayList<oficina> lOfi= new ArrayList<oficina>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `oficinas` where cod_area="+id);
            while (rs.next())
            {
                oficina o= new oficina();
                o.setCodigo_oficina(rs.getInt(1));
                o.setCod_area(rs.getInt(2));
                o.setAbrev(rs.getString(3));
                o.setDescripcion(rs.getString(4));
                lOfi.add(o);
            }
            con.close();
            return lOfi;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

    public void buscar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `oficinas` WHERE `cod_oficina`='"+ getCodigo_oficina() +"'");
            while (rs.next())
            {
                setCod_area(rs.getInt(2));
                setAbrev(rs.getString(3));
                setDescripcion(rs.getString(4));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
