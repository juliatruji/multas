<%-- 
    Document   : Ejemplo
    Created on : 08-oct-2018, 16:51:21
    Author     : Omar V.
--%>

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
            MisMultasDTO [] obj_mimulta = (MisMultasDTO []) session.getAttribute("mismultas");
            int sumatoria = 0;
%>
    <table>
        <thead>
        <tr>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>NumeroLicencia</th>
            <th>Clase</th>
            <th>Categoria</th>
        </tr>
    </thead>
    <tbody>
        
<%
    %><tr><% 

                        
                
               
                %></tr><% 


        %>
        
    </tbody>
    </table>
        
        <table>
        <thead>
            <tr>
                <th>Código de la Multa</th>
                <th>Descripción</th>
                <th>Monto UIT</th>

            </tr>
        </thead>
        <tbody>
            <%
            for (int i = 0; i < obj_mimulta.length; i++) {
                
                    %><tr><% 
                %><td><% out.println(obj_mimulta[i].getCodfaltas()); %></td><%
                %><td><% out.println(obj_mimulta[i].getDescripcion()); %></td><%
                %><td><% out.println(obj_mimulta[i].getMontouit()); %></td><%
               
               
               sumatoria = sumatoria + obj_mimulta[i].getMontouit();
               
                %></tr>
                    
                    <% 
            }
%>
<div id="sumatoria"><% out.println(sumatoria); %></div>
        </tbody>
        
        


    </table>
        <div id="deudatotal">Deuda: S/ <span id="resultado"></span></div> 
        
        
        <script src="js/jquery-3.3.1.min.js"></script>   

    </body>
</html>
