<%-- 
    Document   : Ejemplo
    Created on : 08-oct-2018, 16:51:21
    Author     : Omar V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.MultasDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCION COMPLETADA</title>
        <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
    </head>
    <body>
        <%
            MultasDTO obj_multa = (MultasDTO) session.getAttribute("multa");

        %>
        <div id="content">
            <table class="mitabla" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" class="grilla_cabecera"><h2> NUEVA MULTA AGREGADA!</h2></td>
                </tr>

                <tr>
                    <td>DniConductor:</td>
                    <td> <%= obj_multa.getDni() %> </td>
                </tr>
                <tr>
                    <td>CodigoCip:</td>
                    <td> <%= obj_multa.getCodigocip() %> </td>
                </tr>
                <tr>
                    <td>Direccion:</td>
                    <td> <%= obj_multa.getDireccion() %> </td>
                </tr>

                <tr>
                    <td>Fecha:</td>
                    <td> <%= obj_multa.getFecha() %> </td>
                </tr>
                <tr>
                    <td>Placa:</td>
                    <td> <%= obj_multa.getPlaca() %> </td>
                </tr>
                <tr>
                    <td>CodigoMulta:</td>
                    <td> <%= obj_multa.getCodigomulta() %> </td>
                </tr>
                <tr>
                    <td>Ubicacion:</td>
                    <td> <%= obj_multa.getUbicacion() %> </td>
                </tr> 
                <tr>
                    <td>Observaciones conductor:</td>
                    <td> <%= obj_multa.getObservacionesconductor() %> </td>
                </tr>
                <tr>
                    <td>Observaciones Policia:</td>
                    <td> <%= obj_multa.getObservacionespolicias() %> </td>
                </tr>                

            </table>
        </div>

    </body>
</html>
