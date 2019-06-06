package Models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vicente
 */
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
        int resultado=0;
        String nombres = bean.getNombres();
        String apellidos = bean.getApellidos();
        String dni = bean.getDni();
        String nlicencia = bean.getNlicencia();
        String claselicencia = bean.getClaselicencia();
        String categorialicencia = bean.getCategorialicencia();
        
        
        String Query="INSERT INTO `usuarios`(`nombre`, `apellidos`, `dni`,`id_grupo_usuarios`) VALUES ('"
                +nombres+"','"+apellidos+"','"+dni+"',3);";
        String Query2="INSERT INTO conductor SET id_usuarios = (SELECT MAX(`id_usuarios`) FROM `usuarios`), nro_licencia = '"+nlicencia+"',clase = '"+claselicencia+"',categoria = '"+categorialicencia+"' ";
        System.out.println(Query);
        
        try{
            currentCon=ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            stmt2=currentCon.createStatement();
            stmt.executeUpdate(Query);
            stmt2.executeUpdate(Query2);
            resultado=1;
            
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