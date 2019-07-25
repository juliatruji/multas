<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.MisMultasDTO"%>
<%
    MisMultasDTO[] obj_mimulta = (MisMultasDTO[]) session.getAttribute("mismultas");
    float sumatoria = 0;
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
                        <a href="./index.html" class="btn btn-outline-light"><< Volver</a>




                    </div>
                </nav>
            </div>


            <div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">


                <div class="wrap-login100">


                    <style> .wrap-login100{width: 100%}</style>
                    <form class="login100-form validate-form">
                        <span class="login100-form-title p-b-18 p-t-0">
                            Multas de <% out.println(obj_mimulta[0].getNombre()); %> <% out.println(obj_mimulta[0].getApellidos()); %>
                        </span>
                        <span class="login100-form-title p-b-18 p-t-0">
                            DNI: <% out.println(obj_mimulta[0].getDni()); %>
                        </span>

                        <% if (obj_mimulta[0].getCod_falta() == null) {

                        %>

                        <span class="login100-form-title p-b-18 p-t-0">
                            No tiene multas
                        </span>
                        <%                          } else {

                        %>


                        <div class="container-fluid">
                            <div class="row">
                                <table class="table table-striped table-hover table-dark text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">Cód. Multa</th>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">Monto UIT</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Placa</th>
                                            <th scope="col">Departamento</th>
                                            <th scope="col">Obs. Conductor</th>
                                            <th scope="col">Obs. Policia</th>
                                            <th scope="col">Policia</th>
                                            <th scope="col">CIP</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            for (int i = 0; i < obj_mimulta.length; i++) {
                                        %>
                                        <tr>
                                            <td><% out.println(obj_mimulta[i].getCod_falta()); %></td>

                                            <td class="desclarga" data-toggle="tooltip" data-placement="top" title="<% out.println(obj_mimulta[i].getDescripcion().toString()); %>">
                                                <% out.println(obj_mimulta[i].getDescripcion().toString()); %>
                                            </td>

                                            <td><% out.println(obj_mimulta[i].getMonto_uit()); %></td>
                                            <td><% out.println(obj_mimulta[i].getFecha()); %></td>
                                            <td><% out.println(obj_mimulta[i].getPlaca()); %></td>
                                            <td><% out.println(obj_mimulta[i].getDepartamento()); %></td>
                                            <td><% out.println(obj_mimulta[i].getObs_conductor()); %></td>
                                            <td><% out.println(obj_mimulta[i].getObs_polocia()); %></td>
                                            <td><% out.println(obj_mimulta[i].getNombre_policia() + " " + obj_mimulta[i].getApellido_policia()); %></td>
                                            <td><% out.println(obj_mimulta[i].getCod_cip()); %></td>
                                            <%
                                                sumatoria = sumatoria + obj_mimulta[i].getMonto_uit();
                                            %>
                                        </tr>

                                        <%                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <span class="login100-form-title p-b-18 p-t-0">
                            Deuda Total S/<% out.println((sumatoria*4200)/100); %>
                        </span>

                        <%
                            }
                        %>

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