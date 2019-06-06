
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Utils.ConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.MisMultasDTO;
import java.sql.Connection;


/**
 *
 * @author Omar V.
 */
public class MisMultasDAO {

    public static MisMultasDTO[] getMisdatos(MisMultasDTO prm_mimulta) {
        int posicion = 0;
        MisMultasDTO[] obj_mismultas = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "SELECT id_multas, id_ubicacion, id_vehiculo FROM multas WHERE id_multas=5";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_mismultas = new MisMultasDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                MisMultasDTO obj_mimulta = new MisMultasDTO();

                obj_mimulta.setCodfaltas(rs.getString("id_multas"));
                obj_mimulta.setDescripcion(rs.getString("id_ubicacion"));
                obj_mimulta.setMontouit(rs.getInt("id_vehiculo"));
                obj_mismultas[posicion] = obj_mimulta;
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
        return obj_mismultas;
    }

}
