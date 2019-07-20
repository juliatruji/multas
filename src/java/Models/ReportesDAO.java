/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Utils.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Usuario
 */
public class ReportesDAO {

    public static PoliciaDTO[] verpolicias() {
        int posicion = 0;
        PoliciaDTO[] obj_policias = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT usuarios.nombre, usuarios.apellidos, usuarios.dni, policia.cod_cip, usuarios.alias FROM usuarios, policia WHERE usuarios.id_grupo_usuarios=2 AND policia.id_usuarios=usuarios.id_usuarios";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_policias = new PoliciaDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                PoliciaDTO obj_poli = new PoliciaDTO();
                obj_poli.setNombres(rs.getString("nombre"));
                obj_poli.setApellidos(rs.getString("apellidos"));
                obj_poli.setDni(rs.getString("dni"));
                obj_poli.setCodcip(rs.getString("cod_cip"));
                obj_poli.setAlias(rs.getString("alias"));
                obj_policias[posicion] = obj_poli;
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_policias;
    }

    public static ConductorDTO[] verconductores() {
        int posicion = 0;
        ConductorDTO[] obj_conductores = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT usuarios.nombre, usuarios.apellidos, usuarios.dni, conductor.nro_licencia, conductor.clase, conductor.categoria FROM usuarios, conductor WHERE usuarios.id_grupo_usuarios=3 AND conductor.id_usuarios=usuarios.id_usuarios";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_conductores = new ConductorDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                ConductorDTO obj_conduc = new ConductorDTO();
                obj_conduc.setNombres(rs.getString("nombre"));
                obj_conduc.setApellidos(rs.getString("apellidos"));
                obj_conduc.setDni(rs.getString("dni"));
                obj_conduc.setNlicencia(rs.getString("nro_licencia"));
                obj_conduc.setClaselicencia(rs.getString("clase"));
                obj_conduc.setCategorialicencia(rs.getString("categoria"));
                obj_conductores[posicion] = obj_conduc;
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_conductores;
    }

    public static CodMultasDTO[] vercodmultas() {
        int posicion = 0;
        CodMultasDTO[] obj_codmultas = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT codigo_multa.cod_falta, codigo_multa.descripcion, codigo_multa.clasificacion, codigo_multa.monto_uit, codigo_multa.descuento, sancion.descripcion_sancion, medida_preventiva.descripcion_medida_preventiva FROM codigo_multa, sancion, medida_preventiva WHERE codigo_multa.id_sancion=sancion.id_sancion AND codigo_multa.id_medida_preventiva=medida_preventiva.id_medida_preventiva";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_codmultas = new CodMultasDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                CodMultasDTO obj_codmult = new CodMultasDTO();
                obj_codmult.setCodfaltas(rs.getString("cod_falta"));
                obj_codmult.setDescripcion(rs.getString("descripcion"));
                obj_codmult.setClasificacion(rs.getString("clasificacion"));
                obj_codmult.setMontouit(Integer.parseInt(rs.getString("monto_uit")));
                obj_codmult.setDescuento(rs.getString("descuento"));
                obj_codmult.setSancion(rs.getString("descripcion_sancion"));
                obj_codmult.setMedidapreventiva(rs.getString("descripcion_medida_preventiva"));
                obj_codmultas[posicion] = obj_codmult;
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_codmultas;
    }

    public static PoliciaDTO[] vervehiculos() {
        int posicion = 0;
        PoliciaDTO[] obj_policias = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT usuarios.nombre, usuarios.apellidos, usuarios.dni, policia.cod_cip, usuarios.alias FROM usuarios, policia WHERE usuarios.id_grupo_usuarios=2 AND policia.id_usuarios=usuarios.id_usuarios";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_policias = new PoliciaDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                PoliciaDTO obj_poli = new PoliciaDTO();
                obj_poli.setNombres(rs.getString("nombre"));
                obj_poli.setApellidos(rs.getString("apellidos"));
                obj_poli.setDni(rs.getString("dni"));
                obj_poli.setCodcip(rs.getString("cod_cip"));
                obj_poli.setAlias(rs.getString("alias"));
                obj_policias[posicion] = obj_poli;
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_policias;
    }

    public static PoliciaDTO[] vermultas() {
        int posicion = 0;
        PoliciaDTO[] obj_policias = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT usuarios.nombre, usuarios.apellidos, usuarios.dni, policia.cod_cip, usuarios.alias FROM usuarios, policia WHERE usuarios.id_grupo_usuarios=2 AND policia.id_usuarios=usuarios.id_usuarios";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_policias = new PoliciaDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                PoliciaDTO obj_poli = new PoliciaDTO();
                obj_poli.setNombres(rs.getString("nombre"));
                obj_poli.setApellidos(rs.getString("apellidos"));
                obj_poli.setDni(rs.getString("dni"));
                obj_poli.setCodcip(rs.getString("cod_cip"));
                obj_poli.setAlias(rs.getString("alias"));
                obj_policias[posicion] = obj_poli;
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_policias;
    }

}
