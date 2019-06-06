<%-- 
    Document   : Ejemplo
    Created on : 08-oct-2018, 16:51:21
    Author     : Omar V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.VehiculosDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCION COMPLETADA</title>
        <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
    </head>
    <body>
        <%
            VehiculosDTO obj_vehiculo = (VehiculosDTO) session.getAttribute("vehiculo");

        %>
        <div id="content">
            <table class="mitabla" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" class="grilla_cabecera"><h2> NUEVO VEHICULO AGREGADO!</h2></td>
                </tr>
                <tr>
                    <td>Marca:</td>
                    <td> <%= obj_vehiculo.getMarca()%> </td>
                </tr>
                <tr>
                    <td>Modelo:</td>
                    <td> <%= obj_vehiculo.getModelo()%> </td>
                </tr>
                <tr>
                    <td>Color:</td>
                    <td> <%= obj_vehiculo.getColor()%> </td>
                </tr>
                <tr>
                    <td>Placa:</td>
                    <td> <%= obj_vehiculo.getPlaca()%> </td>
                </tr> 
 
            </table>
        </div>

    </body>
</html>
