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
import static Models.CodMultasDAO.currentCon;
import Models.CodMultasDTO;
import static Models.PoliciaDAO.currentCon;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;

public class CodMultasDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(CodMultasDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtcodmultas=null;
        ResultSet rscodmultas = null;
        int resultado=0;
        String clasificacion = bean.getClasificacion();
        String codfaltas = bean.getCodfaltas();
        String descripcion = bean.getDescripcion();
        String descuento = bean.getDescuento();
        String medidapreventiva = bean.getMedidapreventiva();
        String sancion = bean.getSancion();
        int montouit = bean.getMontouit();
        int puntos = bean.getPuntos();
        
        
        String Querycodmultas ="SELECT * FROM codigo_multa WHERE cod_falta = '"+codfaltas+"' ";
        String Query="INSERT INTO codigo_multa SET id_sancion = '"+sancion+"', id_medida_preventiva = '"+medidapreventiva+"',cod_falta = '"+codfaltas+"',descripcion = '"+descripcion+"',clasificacion = '"+clasificacion+"',monto_uit = '"+montouit+"', descuento = '"+descuento+"',puntos = '"+puntos+"'";
        
        //System.out.println(Query);
        //System.out.println("hola");
        
        try{
            currentCon=ConnectionManager.getConnection();
            stmtcodmultas=currentCon.createStatement();
            rscodmultas = stmtcodmultas.executeQuery(Querycodmultas);
//System.out.println("hola2");
            if (rscodmultas.next()) {
                    resultado=2;
                    System.out.println("insertar result 2" );
            }
            else {
                stmt=currentCon.createStatement();
                stmt2=currentCon.createStatement();
                stmt.executeUpdate(Query);
                resultado=1;
                System.out.println("insertar result 1" );
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