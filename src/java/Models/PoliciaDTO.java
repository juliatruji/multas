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
public class PoliciaDTO
{
    
    private String dni,codcip,alias,password;
    private String nombres,apellidos;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCodcip() {
        return codcip;
    }

    public void setCodcip(String codcip) {
        this.codcip = codcip;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    
    
}
