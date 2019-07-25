<%@page import="Models.CodMultasDTO"%>
<%@page import="Models.ConductorDTO"%>
<%@page import="Models.PoliciaDTO"%>
<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.MisMultasDTO"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if (!currentUser.getId_grupo_usuarios().equals("1")) {
            out.println("<h1>NO estas autorizado</h1>");
            out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
            return;
        }
    } else {
        out.println("<h1>NO estas autorizado</h1>");
        out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
        return;
    }

    String nombreadmin = currentUser.getNombre();
    String apellidosadmin = currentUser.getApellidos();
%>
<%
    CodMultasDTO[] obj_codmultas = (CodMultasDTO[]) session.getAttribute("codmultas");

%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>Login V3</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="./assets/images/icons/favicon.ico" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="./assets/css/util.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
        <!--===============================================================================================-->
    </head>

    <body>

        <div class="limiter">
            <div class="containernav">
                <nav class="navbar navbar-expand-lg navbar-dark justify-content-between">
                    <a class="navbar-brand" href="#"><span class="login100-form-logo">
                            <i class="zmdi zmdi-landscape"></i>
                        </span></a>
                    <div class="navbar-collapse collapse" id="navbarNavAltMarkup" style="">
                        <div class="navbar-nav">
                            <h5 class="nav-item nav-link active" href="#">Multas de Tránsito <span
                                    class="sr-only">(current)</span></h5>
                            <a class="nav-item nav-link" href="#" style="display: none;">Acceder</a>


                        </div>

                    </div>

                    <div class="menurighttop">

                        <div class="dropdown show">
                            <a href="PanelAdministrator.jsp" class="btn btn-outline-light">&lt;&lt; Volver</a>
                            <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="zmdi zmdi-account"></i> <%= nombreadmin%>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="/FormPolicias.jsp"><i class="zmdi zmdi-plus-square"></i> Agregar Policía</a>
                                <a class="dropdown-item" href="/FormConductores.jsp"><i class="zmdi zmdi-plus-square"></i> Agregar Conductor</a>
                                <a class="dropdown-item" href="/FormCodMultas.jsp"><i class="zmdi zmdi-code"></i> Agregar Cód. de Multa</a>
                                <a class="dropdown-item" href="/FormVehiculos.jsp"><i class="zmdi zmdi-car"></i> Agregar Vehículo</a>
                                <hr/>
                                <a class="dropdown-item" href="/Reportes?id=policias"><i class="zmdi zmdi-accounts-alt"></i> Ver Policías </a>
                                <a class="dropdown-item" href="/Reportes?id=conductores"><i class="zmdi zmdi-accounts-alt"></i> Ver Conductores</a>
                                <a class="dropdown-item" href="/Reportes?id=codmultas"><i class="zmdi zmdi-code"></i> Ver Cód. de Multas</a>
                                <a class="dropdown-item" href="/Reportes?id=vehiculos"><i class="zmdi zmdi-view-list-alt"></i> Ver Vehículos</a>
                                <a class="dropdown-item" href="/Reportes?id=multas"><i class="zmdi zmdi-view-list-alt"></i> Ver Multas</a>
                                <hr/>
                                <a class="dropdown-item" href="/exit.jsp"><i class="zmdi zmdi-sign-in"></i> Salir</a>
                            </div>
                        </div>


                    </div>
                </nav>
            </div>


            <div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">


                <div class="wrap-login100">


                    <style> .wrap-login100{width: 100%}</style>
                    <form class="login100-form validate-form">
                        <span class="login100-form-title p-b-18 p-t-0">Lista de Códigos de Faltas
                        </span>
                        <div class="container-fluid">
                            <div class="row">
                                <table class="table table-striped table-hover table-dark text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">Codigo de Multa</th>
                                            <th scope="col">Descripcion</th>
                                            <th scope="col">Clasificación</th>
                                            <th scope="col">Monto UIT</th>
                                            <th scope="col">Descuento</th>
                                            <th scope="col">Sancion</th>
                                            <th scope="col">Medida Preventiva</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < obj_codmultas.length; i++) {
                                        %>
                                        <tr>
                                            <td><% out.println(obj_codmultas[i].getCodfaltas()); %></td>
                                            <td><% out.println(obj_codmultas[i].getDescripcion()); %></td>
                                            <td><% out.println(obj_codmultas[i].getClasificacion()); %></td>
                                            <td><% out.println(obj_codmultas[i].getMontouit()); %></td>
                                            <td><% out.println(obj_codmultas[i].getDescuento()); %></td>
                                            <td><% out.println(obj_codmultas[i].getSancion()); %></td>
                                            <td><% out.println(obj_codmultas[i].getMedidapreventiva()); %></td>
                                        </tr>

                                        <%                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </form>



                </div>
            </div>
        </div>

        <footer class="footer mt-auto py-3 justify-content-between">
            <div>
                <span class="text-muted">© 2019 Multas de Transito</span>


            </div>
        </footer>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="./assets/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/vendor/bootstrap/js/popper.js"></script>
        <script src="./assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/vendor/daterangepicker/moment.min.js"></script>
        <script src="./assets/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="./assets/js/main.js"></script>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>


    </body>

</html>