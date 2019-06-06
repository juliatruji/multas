<%-- 
    Document   : Ejemplo
    Created on : 08-oct-2018, 16:51:21
    Author     : Omar V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.PoliciaDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCION COMPLETADA</title>
        <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
    </head>
    <body>
        <%
            PoliciaDTO obj_policia = (PoliciaDTO) session.getAttribute("policia");

        %>
        <div id="content">
            <table class="mitabla" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" class="grilla_cabecera"><h2> NUEVO POLICIA AGREGADO!</h2></td>
                </tr>
                <tr>
                    <td>Nombres:</td>
                    <td> <%= obj_policia.getNombres() %> </td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td> <%= obj_policia.getApellidos() %> </td>
                </tr>
                <tr>
                    <td>Dni:</td>
                    <td> <%= obj_policia.getDni() %> </td>
                </tr>
                <tr>
                    <td>Codcip:</td>
                    <td> <%= obj_policia.getCodcip() %> </td>
                </tr>
                <tr>
                    <td>Alias:</td>
                    <td> <%= obj_policia.getAlias() %> </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td> <%= obj_policia.getPassword() %> </td>
                </tr>                
            </table>
        </div>

    </body>
</html>
