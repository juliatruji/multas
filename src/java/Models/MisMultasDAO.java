package Models;

import Utils.ConnectionManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Models.MisMultasDTO;
import java.sql.Connection;

public class MisMultasDAO {

    public static MisMultasDTO[] getMisdatos(MisMultasDTO prm_mimulta) {
        int posicion = 0;
        MisMultasDTO[] obj_mismultas = null;
        Connection cn = null;
        ResultSet rs = null;
        String midni = prm_mimulta.getDni();
        PreparedStatement ps = null;
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select usuarios.id_usuarios, usuarios.nombre, usuarios.apellidos, usuarios.dni, conductor.nro_licencia, conductor.id_conductor,multas.estado, multas.fecha, multas.obs_conductor, multas.obs_policia, codigo_multa.descripcion, codigo_multa.cod_falta,codigo_multa.clasificacion, codigo_multa.monto_uit, sancion.descripcion_sancion, medida_preventiva.descripcion_medida_preventiva, ubicacion.departamento, multas.direccion, vehiculo.placa,policia.cod_cip, UP.nombre AS nombre_policia, UP.apellidos AS apellido_policia from usuarios LEFT JOIN conductor on conductor.id_usuarios = usuarios.id_usuarios LEFT JOIN multas on multas.id_conductor = conductor.id_conductor LEFT JOIN policia on policia.id_policia = multas.id_policia LEFT JOIN `usuarios` UP on UP.id_usuarios = policia.id_usuarios LEFT JOIN codigo_multa on codigo_multa.id_codigo_multa = multas.id_codigo_multa LEFT JOIN sancion on sancion.id_sancion = multas.id_codigo_multa LEFT JOIN medida_preventiva on medida_preventiva.id_medida_preventiva = multas.id_codigo_multa LEFT JOIN ubicacion on ubicacion.id_ubicacion = multas.id_ubicacion LEFT JOIN vehiculo on vehiculo.id_vehiculo = multas.id_vehiculo where usuarios.dni = '"+midni+"'";
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

                obj_mimulta.setId_usuarios(rs.getInt("id_usuarios"));
                obj_mimulta.setNombre(rs.getString("nombre"));
                obj_mimulta.setApellidos(rs.getString("apellidos"));
                obj_mimulta.setDni(rs.getString("dni"));
                obj_mimulta.setNro_licencia(rs.getString("nro_licencia"));
                obj_mimulta.setId_conductor(rs.getInt("id_conductor"));
                obj_mimulta.setEstado(rs.getString("estado"));
                obj_mimulta.setFecha(rs.getString("fecha"));
                obj_mimulta.setObs_conductor(rs.getString("obs_conductor"));
                obj_mimulta.setObs_polocia(rs.getString("obs_policia"));
                obj_mimulta.setDescripcion(rs.getString("descripcion"));
                obj_mimulta.setCod_falta(rs.getString("cod_falta"));
                obj_mimulta.setClasificacion(rs.getString("clasificacion"));
                obj_mimulta.setMonto_uit(rs.getFloat("monto_uit"));
                obj_mimulta.setDescripcion_sancion(rs.getString("descripcion_sancion"));
                obj_mimulta.setDescripcion_medida_preventiva(rs.getString("descripcion_medida_preventiva"));
                obj_mimulta.setDepartamento(rs.getString("departamento"));
                obj_mimulta.setDireccion(rs.getString("direccion"));
                obj_mimulta.setPlaca(rs.getString("placa"));
                obj_mimulta.setCod_cip(rs.getString("cod_cip"));
                obj_mimulta.setNombre_policia(rs.getString("nombre_policia"));
                obj_mimulta.setApellido_policia(rs.getString("apellido_policia"));

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
