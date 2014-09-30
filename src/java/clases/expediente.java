/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author miky
 */
public class expediente {
    private int n_expediente;
    private String dni;
    private String descripcion;

    public int getN_expediente() {
        return n_expediente;
    }

    public void setN_expediente(int n_expediente) {
        this.n_expediente = n_expediente;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void agregar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `expediente`(`dni`, `descripcion`) VALUES ('"+ getDni() +"','"+ getDescripcion() +"')");

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
            ResultSet rs = s.executeQuery ("SELECT * FROM `expediente` WHERE `dni`='"+ getDni() +"'");
            while (rs.next())
            {
                setN_expediente(rs.getInt(1));
                setDescripcion(rs.getString(3));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
