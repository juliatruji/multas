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
import java.text.*;
import java.util.*;
import java.sql.*;

public class PoliciaDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(PoliciaDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String nombres = bean.getNombres();
        String apellidos = bean.getApellidos();
        String dni = bean.getDni();
        String codigoCIP = bean.getCodcip();
        String alias = bean.getAlias();
        String password = bean.getPassword();
        
        String Querydni ="SELECT * FROM usuarios WHERE dni = '"+dni+"' ";
        String Queryalias ="SELECT * FROM usuarios WHERE alias = '"+alias+"' ";
        
        String Query= "INSERT INTO `usuarios`(`nombre`, `apellidos`, `dni`, `alias`, `password`,`id_grupo_usuarios`) VALUES ('"
                +nombres+"','"+apellidos+"','"+dni+"','"+alias+"','"+password+"',2)";
        String Query2="INSERT INTO policia SET id_usuarios = (SELECT MAX(`id_usuarios`) FROM `usuarios`), cod_cip = '"+codigoCIP+"' ";
        System.out.println(Query);
          
        try{
            currentCon=ConnectionManager.getConnection();
            stmtdni=currentCon.createStatement();
            rsdni = stmtdni.executeQuery(Querydni);
            
            stmtalias=currentCon.createStatement();
            rsalias = stmtalias.executeQuery(Queryalias);

            if (rsdni.next()) {
                    resultado=2;
            }
            else if (rsalias.next()) {
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