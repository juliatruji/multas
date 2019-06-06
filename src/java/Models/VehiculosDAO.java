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
import Utils.ConnectionManager;
import Models.VehiculosDTO;
import java.text.*;
import java.util.*;
import java.sql.*;

public class VehiculosDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(VehiculosDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        int resultado=0;
        String marca = bean.getMarca();
        String modelo = bean.getModelo();
        String color = bean.getColor();
        String placa = bean.getPlaca();
        String dni=bean.getDni();
        
        String Query= "INSERT INTO `vehiculo`(`marca`, `modelo`, `color`, `placa`) VALUES ('"
                +marca+"','"+modelo+"','"+color+"','"+placa+"')";
        String Query2="INSERT INTO propietario SET id_vehiculo = (SELECT MAX(`id_vehiculo`) FROM `vehiculo`), id_usuarios = (SELECT id_usuarios FROM usuarios WHERE dni = '"+dni+"' LIMIT 1)";
        
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