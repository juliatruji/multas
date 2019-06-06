<%-- 
    Document   : Ejemplo
    Created on : 08-oct-2018, 16:51:21
    Author     : Omar V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.CodMultasDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCION COMPLETADA</title>
        <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
    </head>
    <body>
        <%
            CodMultasDTO obj_codigo = (CodMultasDTO) session.getAttribute("codigomulta");

        %>
        <div id="content">
            <table class="mitabla" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" class="grilla_cabecera"><h2> NUEVO MULTA AGREGADA!</h2></td>
                </tr>
                <tr>
                    <td>Codfaltas:</td>
                    <td> <%= obj_codigo.getCodfaltas() %> </td>
                </tr>
                <tr>
                    <td>Descripcion:</td>
                    <td> <%= obj_codigo.getDescripcion() %> </td>
                </tr>
                <tr>
                    <td>Clasificacion:</td>
                    <td> <%= obj_codigo.getClasificacion() %> </td>
                </tr>
                <tr>
                    <td>Montouit:</td>
                    <td> <%= obj_codigo.getMontouit() %> </td>
                </tr>
                <tr>
                    <td>Descuento:</td>
                    <td> <%= obj_codigo.getDescuento() %> </td>
                </tr>
                <tr>
                    <td>Sancion:</td>
                    <td> <%= obj_codigo.getSancion() %> </td>
                </tr>
                <tr>
                    <td>Puntos:</td>
                    <td> <%= obj_codigo.getPuntos() %> </td>
                </tr> 
                <tr>
                    <td>Medidapreventiva:</td>
                    <td> <%= obj_codigo.getMedidapreventiva() %> </td>
                </tr>                                
            </table>
        </div>

    </body>
</html>
