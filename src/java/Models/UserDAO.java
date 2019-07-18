package Models;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;

public class UserDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static UserDTO login(UserDTO bean) {

        Statement stmt = null;

        String username = bean.getUsername();
        String password = bean.getPassword();

        String searchQuery
                = "SELECT U.nombre, U.apellidos, U.dni, U.id_grupo_usuarios FROM `usuarios` U where alias='"
                + username
                + "' AND password='"
                + password
                + "'";
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            bean.setValid(false);
            String nombres = "";
            String apellidos = "";
            String dni = "";
            String idgrupouser = "";
            
            if (rs.last()) {
                int tamanio = rs.getRow();
                if (tamanio > 0) {
                    bean.setValid(true);
                }
                rs.beforeFirst();
            }

            while (rs.next()) {
                nombres = rs.getString("nombre");
                apellidos = rs.getString("apellidos");
                dni = rs.getString("dni");
                idgrupouser = rs.getString("id_grupo_usuarios");

            }
            bean.setNombre(nombres);
            bean.setApellidos(apellidos);
            bean.setDni(dni);
            bean.setId_grupo_usuarios(idgrupouser);

        } catch (Exception ex) {
            System.out.println("Log In INCORRECTO: " + ex);
        }
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;

    }

}
