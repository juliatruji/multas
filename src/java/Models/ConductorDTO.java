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
public class ConductorDTO
{
    private String dni;
    private String nombres,apellidos,nlicencia,claselicencia,categorialicencia;
    public String getNombres()
    {
        return nombres;
    }
    public void setNombres(String nombres)
    {
        this.nombres = nombres;
    }
    public String getApellidos()
    {
        return apellidos;
    }
    public void setApellidos(String apellidos)
    {
        this.apellidos = apellidos;
    }
    public String getDni()
    {
        return dni;
    }
    public void setDni(String dni)
    {
        this.dni = dni;
    }
    public String getNlicencia()
    {
        return nlicencia;
    }
    public void setNlicencia(String nlicencia)
    {
        this.nlicencia = nlicencia;
    }
    public String getClaselicencia()
    {
        return claselicencia;
    }
    public void setClaselicencia(String claselicencia)
    {
        this.claselicencia = claselicencia;
    }
    public String getCategorialicencia()
    {
        return categorialicencia;
    }
    public void setCategorialicencia(String categorialicencia)
    {
        this.categorialicencia = categorialicencia;
    }
    
}
