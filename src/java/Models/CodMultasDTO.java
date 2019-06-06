/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Omar V.
 */
public class CodMultasDTO
{
    private int montouit,puntos;
    private String codfaltas,descripcion,clasificacion,descuento,categorialicencia,medidapreventiva,sancion;
    public String getCodfaltas()
    {
        return codfaltas;
    }
    public void setCodfaltas(String codfaltas)
    {
        this.codfaltas = codfaltas;
    }
    public String getDescripcion()
    {
        return descripcion;
    }
    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }
    public String getClasificacion()
    {
        return clasificacion;
    }
    public void setClasificacion(String clasificacion)
    {
        this.clasificacion = clasificacion;
    }
    public String getDescuento()
    {
        return descuento;
    }
    public void setDescuento(String descuento)
    {
        this.descuento = descuento;
    }
    public int getMontouit()
    {
        return montouit;
    }
    public void setMontouit(int montouit)
    {
        this.montouit = montouit;
    }
    public int getPuntos()
    {
        return puntos;
    }
    public void setPuntos(int puntos)
    {
        this.puntos = puntos;
    }
    public String getSancion()
    {
        return sancion;
    }
    public void setSancion(String sancion)
    {
        this.sancion = sancion;
    } 
    public String getMedidapreventiva()
    {
        return medidapreventiva;
    }
    public void setMedidapreventiva(String medidapreventiva)
    {
        this.medidapreventiva = medidapreventiva;
    }         
    
}
