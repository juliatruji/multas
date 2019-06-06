/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;

/**
 *
 * @author Omar V.
 */
public class MultasDTO
{
    private String dni,codigocip, direccion;
    private String fecha;
    private String placa, codigomulta,ubicacion, observacionesconductor,observacionespolicias ;

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCodigocip() {
        return codigocip;
    }

    public void setCodigocip(String codigocip) {
        this.codigocip = codigocip;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }


    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getCodigomulta() {
        return codigomulta;
    }

    public void setCodigomulta(String codigomulta) {
        this.codigomulta = codigomulta;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getObservacionesconductor() {
        return observacionesconductor;
    }

    public void setObservacionesconductor(String observacionesconductor) {
        this.observacionesconductor = observacionesconductor;
    }

    public String getObservacionespolicias() {
        return observacionespolicias;
    }

    public void setObservacionespolicias(String observacionespolicias) {
        this.observacionespolicias = observacionespolicias;
    }
    
}
