<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.MisMultasDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RESULTADOS</title>

        <link href="css/tabla.css" rel="stylesheet">

    </head>
    <body>
        <%
            MisMultasDTO[] obj_mimulta = (MisMultasDTO[]) session.getAttribute("mismultas");
            float sumatoria = 0;
        %>
        <table>
            <thead>
                <tr>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>NumeroLicencia</th>
                </tr>
            </thead>
            <tbody>

                <%
                %><tr><%
                    %><td><% out.println(obj_mimulta[0].getNombre()); %></td><%
                    %><td><% out.println(obj_mimulta[0].getApellidos()); %></td><%
                    %><td><% out.println(obj_mimulta[0].getNro_licencia()); %></td><%


                    %></tr><%
                    %>

            </tbody>
        </table>
        <%        if (obj_mimulta[0].getCod_falta() == null) {
        %>
    <did>
        <h3 style="text-align:center">Usted no tiene Multas</h3> 
    </did>
    <div class="buttton" >
        <button id="buttton" type="submit">salir
        </button>
    </div>



    <%
            return;
        }
    %>



    <table>
        <thead>
            <tr>
                <th>Código de la Multa</th>
                <th>Descripción</th>
                <th>Monto UIT</th>
                <th>Fecha</th>
                <th>Placa</th>
                <th>Departamento</th>
                <th>Obs. Conductor</th>
                <th>Obs. Policia</th>
                <th>Policia</th>
                <th>CIP</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < obj_mimulta.length; i++) {
                    if (obj_mimulta[i].getNro_licencia() != null) {

            %><tr><%
                %><td><% out.println(obj_mimulta[i].getCod_falta()); %></td><%
                %><td><% out.println(obj_mimulta[i].getDescripcion()); %></td><%
                %><td><% out.println(obj_mimulta[i].getMonto_uit()); %></td><%
                %><td><% out.println(obj_mimulta[i].getFecha()); %></td><%
                %><td><% out.println(obj_mimulta[i].getPlaca()); %></td><%
                %><td><% out.println(obj_mimulta[i].getDepartamento()); %></td><%
                %><td><% out.println(obj_mimulta[i].getObs_conductor()); %></td><%
                %><td><% out.println(obj_mimulta[i].getObs_polocia()); %></td><%
                %><td><% out.println(obj_mimulta[i].getNombre_policia() + " " + obj_mimulta[i].getApellido_policia()); %></td><%
                %><td><% out.println(obj_mimulta[i].getCod_cip()); %></td><%

                    sumatoria = sumatoria + obj_mimulta[i].getMonto_uit();

                %></tr>

            <%                            }

                }
            %>

        <div id="sumatoria"><% out.println(sumatoria);%></div>
    </tbody>




</table>
<div id="deudatotal">Deuda: S/ <span id="resultado"></span></div> 


<script src="js/jquery-3.3.1.min.js"></script>   
<script>
    const uit = 4200;
    var total = $("#sumatoria").html();
    var deuda = uit * total / 100;
    $("#resultado").html(deuda);
</script>

<script src="js/tabla.js"></script>
</body>
</html>
