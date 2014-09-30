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
public class usuario {
    private String dni;
    private String nombre;
    private String apelllido;
    private String usuario;
    private String password;
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApelllido() {
        return apelllido;
    }

    public void setApelllido(String apelllido) {
        this.apelllido = apelllido;
    }

    public void agregar(){
         conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            s.executeUpdate("INSERT INTO `usuario`(`DNI`, `nombre`, `apellidos`, `login`, `password`) VALUES ('"+ getDni() +"','"+ getNombre() +"','"+ getApelllido() +"','"+ getUsuario() +"','"+ getPassword() +"')");

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public int validar(){
        int verificar=0;
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT COUNT(login) FROM  `usuario` WHERE `login` =  '"+ getUsuario() +"' AND  `password` =  '"+ getPassword() +"' ");
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

     public void buscar(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM  `usuario` WHERE `login` =  '"+ getUsuario() +"'");
            while (rs.next())
            {
                setDni(rs.getString(1));
                setNombre(rs.getString(2));
                setApelllido(rs.getString(3));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     public int buscarxdni(){
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        int i=0;
        try {
            s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT count(dni) FROM  `usuario` WHERE `dni` =  '"+ getDni() +"'");
            while (rs.next())
            {
                i=rs.getInt(1);
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  i;
     }

      public ArrayList<usuario> listar(){
        ArrayList<usuario> lUsuario= new ArrayList<usuario>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `usuario` ");
            while (rs.next())
            {
                usuario u= new usuario();
                u.setDni(rs.getString(1));
                u.setNombre(rs.getString(2));
                u.setApelllido(rs.getString(3));
                u.setUsuario(rs.getString(4));
                u.setPassword(rs.getString(5));
                lUsuario.add(u);
            }
            con.close();
            return lUsuario;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }
public ArrayList<usuario> listar(String dato){
        ArrayList<usuario> lUsuario= new ArrayList<usuario>();
        conexion conexion= new conexion();
        Connection con=(Connection) conexion.conectar();
        Statement s;
        try{
             s = (Statement) con.createStatement();
            ResultSet rs = s.executeQuery ("SELECT * FROM `usuario` where `DNI` like '"+ dato +"%' or `nombre` like '%"+ dato +"%' or `apellidos`  like '%"+ dato +"%'");
            while (rs.next())
            {
                usuario u= new usuario();
                u.setDni(rs.getString(1));
                u.setNombre(rs.getString(2));
                u.setApelllido(rs.getString(3));
                u.setUsuario(rs.getString(4));
                u.setPassword(rs.getString(5));
                lUsuario.add(u);
            }
            con.close();
            return lUsuario;
        }catch (SQLException ex){
            ex.printStackTrace();
            return null;
        }

    }

}
