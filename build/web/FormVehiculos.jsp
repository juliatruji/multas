<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <!--							<hr/>
                                                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-accounts-alt"></i> Ver Policías</a>
                                                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-accounts-alt"></i> Ver Conductores</a>
                                                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-code"></i> Ver Cód. de Multas</a>
                                                                                        <a class="dropdown-item" href="#"><i class="zmdi zmdi-view-list-alt"></i> Ver Vehículos</a>-->
                                <hr/>
                                <a class="dropdown-item" href="/JspFormLogin.jsp"><i class="zmdi zmdi-sign-in"></i> Salir</a>
                            </div>
                        </div>


                    </div>
                </nav>
            </div>


            <div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">
                <div class="wrap-login100">
                    <form id="formulariovehiculos" class="login100-form validate-form" action="RegistroVehiculos" method="POST">
                        <!-- <span class="login100-form-logo">
                                <i class="zmdi zmdi-landscape"></i>
                        </span> -->

                        <span class="login100-form-title p-b-34 p-t-27">
                            <i class="zmdi zmdi-account-add"></i> Registro de Vehiculos
                        </span>

                        <div class="form-group validate-input" data-validate="Elige la marca del vehiculo">
                            <label for="marca"><i class="zmdi zmdi-sign-in"></i>
                                Marca de Vehiculo</label>
                            <select id="marca" class="form-control formulariosselect" name="marca">
                                <option value=""> Elige la Marca</option>
                                <option value="1">Toyota</option>
                                <option value="2">Nissan</option>
                                <option value="3">Hyundai</option>


                            </select>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Escribe el modelo del vehiculo">
                            <input id="modelo" class="input100" type="text" name="modelo" placeholder="Escribe el modelo del vehiculo">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Escribe el color del vehiculo">
                            <input id="color" class="input100" type="text" name="color" placeholder="Escribe el color del vehiculo">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Escribe la placa del vehiculo">
                            <input id="placa" class="input100" type="text" name="placa" max="6" placeholder="Escribe la placa del vehiculo">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>



                        <div class="wrap-input100 validate-input" data-validate="Escribe el dni del Propietario">
                            <input id="dnipropietario" class="input100" type="text" name="dnipropietario" placeholder="Escribe el dni del Propietario">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>


                        <!--
                        
                        <div class="form-group validate-input" data-validate="Enter password">
                        
                                                                        <label for="exampleFormControlTextarea1"><i class="zmdi zmdi-sign-in"></i> Observaciones del
                                                                                Conductor</label>
                                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        
                        
                                                                </div>
                                                                <div class="doblecolumn">
                                                                        <div class="form-group validate-input">
                                                                                <label for="exampleFormControlTextarea1"><i class="zmdi zmdi-sign-in"></i>
                                                                                        Departamento</label>
                                                                                <select class="form-control formulariosselect">
                                                                                        <option>1</option>
                                                                                        <option>2</option>
                                                                                        <option>3</option>
                                                                                        <option>4</option>
                                                                                        <option>5</option>
                                                                                </select>
                                                                        </div>
                                                                        <div class="form-group validate-input">
                                                                                        <label for="exampleFormControlTextarea1"><i class="zmdi zmdi-sign-in"></i>
                                                                                                Departamento</label>
                                                                                        <select class="form-control formulariosselect">
                                                                                                <option>1</option>
                                                                                                <option>2</option>
                                                                                                <option>3</option>
                                                                                                <option>4</option>
                                                                                                <option>5</option>
                                                                                        </select>
                                                                                </div>
                                                                </div>
                        
                        
                                                                <div class="contact100-form-checkbox">
                                                                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                                                        <label class="label-checkbox100" for="ckb1">
                                                                                Remember me
                                                                        </label>
                                                                </div>
                             
                        -->

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" onclick="sendAjaxVehiculos()">
                                Agregar
                            </button>
                        </div>

                        <div class="text-center p-t-90">
                            <a class="txt1" href="#">
                                :)
                            </a>
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



                                function sendAjaxVehiculos() {
                                    event.preventDefault();
                                    if (!validarForm()) {
                                        return;
                                    }
                                    var datos = new Object();
                                    datos.marca = $('#marca').val();
                                    datos.modelo = $('#modelo').val();
                                    datos.color = $('#color').val();
                                    datos.placa = $('#placa').val();
                                    datos.dnipropietario = $('#dnipropietario').val();
                                    $.ajax({
                                        method: "POST",
                                        url: "RegistroVehiculos",
                                        data: {
                                            marca: datos.marca,
                                            modelo: datos.modelo,
                                            color: datos.color,
                                            placa: datos.placa,
                                            dnipropietario: datos.dnipropietario,

                                        },
                                    })
                                            .done(function (data) {

                                                if (data === "error dni") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'El dni no existe',
                                                        icon: 'error',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                } else if (data === "error placa") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'La placa ya existe',
                                                        icon: 'error',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                } else {
                                                    $.toast({
                                                        heading: 'Ok',
                                                        text: 'Registrado Correctamente',
                                                        icon: 'success',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                    //$("#formagregarpolicia").reset();
                                                    $('#formulariovehiculos').trigger("reset");
                                                }
                                            });
                                }
                                ;

        </script>

    </body>

</html>
