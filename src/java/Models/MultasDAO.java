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
import static Models.VehiculosDAO.currentCon;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;
import java.sql.Date;

public class MultasDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static int Register(MultasDTO bean) {
        Statement stmt = null;
        Statement stmtdni = null;
        Statement stmtcip = null;
        Statement stmtplaca = null;
        ResultSet rsdni = null;
        ResultSet rsdcip = null;
        ResultSet rsnplaca = null;

        int resultado = 0;
        String dniconductor = bean.getDni();
        String codigocip = bean.getCodigocip();
        String fecha = bean.getFecha();
        String codigomulta = bean.getCodigomulta();
        String placa = bean.getPlaca();
        String direccion = bean.getDireccion();
        String ubicacion = bean.getUbicacion();
        String observacionconductor = bean.getObservacionesconductor();
        String observacionpolicia = bean.getObservacionespolicias();

        String Querydni = "SELECT * FROM usuarios WHERE dni = '" + dniconductor + "' AND id_grupo_usuarios = 3";
        String Querycip = "SELECT * FROM policia WHERE cod_cip = '" + codigocip + "' ";
        String Queryplaca = "SELECT * FROM vehiculo WHERE placa = '" + placa + "' ";

        String Query = "INSERT INTO multas SET id_conductor = (SELECT id_conductor from conductor, usuarios where usuarios.id_usuarios=(SELECT id_usuarios FROM usuarios WHERE dni = '" + dniconductor + "' LIMIT 1) LIMIT 1),id_policia = (SELECT id_policia FROM policia WHERE cod_cip = '" + codigocip + "' LIMIT 1), id_codigo_multa = (SELECT id_codigo_multa FROM codigo_multa WHERE cod_falta = '" + codigomulta + "' LIMIT 1),id_ubicacion = '" + ubicacion + "',fecha = '" + fecha + "',estado = 'd',id_vehiculo = (SELECT id_vehiculo FROM vehiculo WHERE placa = '" + placa + "' LIMIT 1),direccion = '" + direccion + "', obs_conductor = '" + observacionconductor + "',obs_policia = '" + observacionpolicia + "'";

        //System.out.println(Query);
        try {
            currentCon = ConnectionManager.getConnection();
            stmtdni = currentCon.createStatement();
            rsdni = stmtdni.executeQuery(Querydni);

            stmtcip = currentCon.createStatement();
            rsdcip = stmtcip.executeQuery(Querycip);

            stmtplaca = currentCon.createStatement();
            rsnplaca = stmtplaca.executeQuery(Queryplaca);

            if (rsdni.next()) {

                if (rsdcip.next()) {
                    if (rsnplaca.next()) {
                        currentCon = ConnectionManager.getConnection();
                        stmt = currentCon.createStatement();
                        stmt.executeUpdate(Query);
                        resultado = 1;
                    } else {
                        resultado = 4;
                    }

                } else {
                    resultado = 3;
                }

            } else {
                resultado = 2;
            }

        } catch (Exception ex) {
            System.out.println("insertar fallido" + ex);

        } finally {
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
        return resultado;
    }

}
