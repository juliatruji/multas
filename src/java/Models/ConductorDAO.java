package Models;
import static Models.PoliciaDAO.currentCon;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;

public class ConductorDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(ConductorDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtnlicencia=null;
        ResultSet rsdni = null;
        ResultSet rsnlicencia = null;
        
        int resultado=0;
        String nombres = bean.getNombres();
        String apellidos = bean.getApellidos();
        String dni = bean.getDni();
        String nlicencia = bean.getNlicencia();
        String claselicencia = bean.getClaselicencia();
        String categorialicencia = bean.getCategorialicencia();
        
        String Querydni ="SELECT * FROM usuarios WHERE dni = '"+dni+"' ";
        String Querynlicencia ="SELECT * FROM conductor WHERE nro_licencia = '"+nlicencia+"' ";
        
        String Query="INSERT INTO `usuarios`(`nombre`, `apellidos`, `dni`,`id_grupo_usuarios`) VALUES ('"
                +nombres+"','"+apellidos+"','"+dni+"',3);";
        String Query2="INSERT INTO conductor SET id_usuarios = (SELECT MAX(`id_usuarios`) FROM `usuarios`), nro_licencia = '"+nlicencia+"',clase = '"+claselicencia+"',categoria = '"+categorialicencia+"' ";
        System.out.println(Query);
        
        try{
            currentCon=ConnectionManager.getConnection();
            stmtdni=currentCon.createStatement();
            rsdni = stmtdni.executeQuery(Querydni);
            
            stmtnlicencia=currentCon.createStatement();
            rsnlicencia = stmtnlicencia.executeQuery(Querynlicencia);

            if (rsdni.next()) {
                    resultado=2;
            }
            else if (rsnlicencia.next()) {
                    resultado=3;
            }
            else {
                stmt=currentCon.createStatement();
                stmt2=currentCon.createStatement();
                stmt.executeUpdate(Query);
                stmt2.executeUpdate(Query2);
                resultado=1;
            }
            
        }
        catch(Exception ex){
            System.out.println("insertar fallido" + ex);
            
        }
        
        finally{
            if(rs != null){
                try{
                    rs.close();
                }catch (Exception e){}
                rs=null;
            }
            if(stmt  != null){
                try {
                    stmt.close();
                }catch(Exception e){}
                stmt=null;
            }
            if(currentCon != null){
                try{
                    currentCon.close();
                }catch(Exception e){}
                currentCon=null;
            }
            
        }
        return resultado;
    }
    
}