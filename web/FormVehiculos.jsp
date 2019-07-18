<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if(!currentUser.getId_grupo_usuarios().equals("1")){
            out.println("<h1>NO estas autorizado</h1>");
            out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
            return;
        }
    }
    else {
        out.println("<h1>NO estas autorizado</h1>");
        out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
        return;
    }
    
    String nombreadmin = currentUser.getNombre();
    String apellidosadmin = currentUser.getApellidos();
%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilo.css" type="text/css" media="all">
    </head>
    <body>

        <form id="formulariovehiculos" class="formulario" action="RegistroVehiculos" method="POST">
            <h1>Registro de Vehiculos</h1>
            <div>
                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" placeholder="Escribe la Marca del vehiculo"/>

            </div>
            <div>
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" placeholder="Escribe el modelo del vehiculo"/>
            </div>
                <div>
                    <label for="color">Color</label>
                    <input type="text" id="color" name="color" placeholder="Escribe el color del vehiculo"/>
                </div>
                <div>
                    <label for="placa">Placa </label>
                    <input type="text" id="placa" name="placa" placeholder="Escribe la placa del vehiculo"/>
                </div>
                <div>
                    <label for="dnipropietario">Dni Propietario </label>
                    <input type="text" id="dnipropietario" name="dnipropietario" placeholder="Escribe la placa del Propietario"/>
                </div>              
               
            <div class="doblecolumna">
                <div><button id="registrarpolicias" type="submit">Registrar
                    </button>
                </div>
                <div><button type="reset">Borrar
                    </button>
                </div>
            </div>
        </form>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/scripts.js"></script>

    </body>
</html>
