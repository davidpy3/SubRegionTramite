
package clases;
import java.sql.*;
/**
 *
 * @author miky
 */
public class conexion {
    public String bd = "stdsrp";
    public String login = "root";
    public String password = "";
    public String url = "jdbc:mysql://localhost/"+bd;
    public Connection conectar() {
        Connection conn = null;
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            conn = DriverManager.getConnection(url, login, password);
            if (conn != null)
            {
            System.out.println("Conexión a base de datos "+url+" ... Ok");
            }
        }
        catch(SQLException ex) {
            System.out.println("Hubo un problema al intentar conectarse con la base de datos "+url);
        }
        catch(ClassNotFoundException ex) {
            System.out.println(ex);
        }
        return conn;
    }
}
