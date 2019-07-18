<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.ConductorDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACCION COMPLETADA</title>
        <link rel="stylesheet" type="text/css" href="css/StyleSheet2.css">
    </head>
    <body>
        <%
            ConductorDTO obj_conductor = (ConductorDTO) session.getAttribute("conductor");

        %>
        <div id="content">
            <table class="mitabla" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" class="grilla_cabecera"><h2> NUEVO CONDUCTOR AGREGADO!</h2></td>
                </tr>
                <tr>
                    <td>Nombres:</td>
                    <td> <%= obj_conductor.getNombres() %> </td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td> <%= obj_conductor.getApellidos() %> </td>
                </tr>
                <tr>
                    <td>Dni:</td>
                    <td> <%= obj_conductor.getDni() %> </td>
                </tr>
                <tr>
                    <td>Nlicencia:</td>
                    <td> <%= obj_conductor.getNlicencia() %> </td>
                </tr>
                <tr>
                    <td>Claselicencia:</td>
                    <td> <%= obj_conductor.getClaselicencia() %> </td>
                </tr>
                <tr>
                    <td>Categorialicencia:</td>
                    <td> <%= obj_conductor.getCategorialicencia() %> </td>
                </tr>
            </table>
        </div>

    </body>
</html>
