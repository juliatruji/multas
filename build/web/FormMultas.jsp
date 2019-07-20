<%@page import="Models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% UserDTO currentUser = (UserDTO) session.getAttribute("currentSessionUser"); %>
<%
    if (currentUser != null) {
        if (!currentUser.getId_grupo_usuarios().equals("2")) {
            out.println("<h1>NO estas autorizado</h1>");
            out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
            return;
        }
    } else {
        out.println("<h1>NO estas autorizado</h1>");
        out.println("<a href=\"/JspFormLogin.jsp\">Ingresar</a>");
        return;
    }

    String nombrepolicia = currentUser.getNombre();
    String apellidospolicia = currentUser.getApellidos();
%>

<html lang="es">

    <head>
        <title>Registro codigo de multas</title>
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
                            <a href="PanelPolicia.jsp" class="btn btn-outline-light">&lt;&lt; Volver</a>
                            <a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="zmdi zmdi-account"></i> <%= nombrepolicia%>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="/FormMultas.jsp"><i class="zmdi zmdi-plus-square"></i> Agregar Multa</a>

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
                    <form id="formulariomultas" class="login100-form validate-form" action="RegistroMultas" method="POST">
                        <!-- <span class="login100-form-logo">
                                <i class="zmdi zmdi-landscape"></i>
                        </span> -->

                        <span class="login100-form-title p-b-34 p-t-27">
                            <i class="zmdi zmdi-account-add"></i> Registro de Multas de Conductores
                        </span>

                        <div class="doblecolumn">
                            <div class="wrap-input100 validate-input" data-validate="Escribe el DNI del conductor">
                                <input id="dni" class="input100" type="number" name="dni" placeholder="DNI del Conductor">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Escribe el Código CIP del Policia">
                                <input id="cip" class="input100" type="number" name="cip" placeholder="CIP del Policia">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                        </div>
                        <div class="doblecolumn">
                            <div class="form-group validate-input" data-validate="Elige el codigo de multa">
                                <label for="multa"><i class="zmdi zmdi-sign-in"></i>
                                    Codigo de la Multa</label>
                                <select id="multa" class="form-control formulariosselect" name="multa">
                                    <option value="M01">M01</option>
                                    <option value="M02">M02</option>
                                    <option value="M03">M03</option>
                                    <option value="M04">M04</option>
                                    <option value="M05">M05</option>
                                    <option value="M06">M06</option>
                                    <option value="M07">M07</option>
                                    <option value="M08">M08</option>
                                    <option value="M09">M09</option>
                                </select>
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Escribe la Fecha">
                                <input id="fecha" class="input100" type="date" name="fecha">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Escribe la Placa">
                            <input id="placa" class="input100" type="text" name="placa" placeholder="Placa del Vehículo">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Escribe la Dirección">
                            <input id="direccion" class="input100" type="text" name="direccion" placeholder="Escribe la direccion">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        <div class="form-group validate-input" data-validate="Elige la Ubicación">
                            <label for="ubicacion"><i class="zmdi zmdi-sign-in"></i>
                                Ubicación</label>
                            <select id="ubicacion" class="form-control formulariosselect" name="ubicacion">
                                <option value="1">Amazonas</option>
                                <option value="2">Áncash</option>
                                <option value="3">Apurímac</option>
                                <option value="4">Arequipa</option>
                                <option value="5">Ayacucho</option>
                                <option value="6">Cajamarca</option>
                                <option value="7">Callao</option>
                                <option value="8">Cusco</option>
                                <option value="9">Huancavelica</option>
                                <option value="10">Huánuco</option>
                                <option value="11">Ica</option>
                                <option value="12">Junín</option>
                                <option value="13">La Libertad</option>
                                <option value="14">Lambayeque</option>
                                <option value="15">Lima</option>
                                <option value="16">Loreto</option>
                                <option value="17">Madre de Dios</option>
                                <option value="18">Moquegua</option>
                                <option value="19">Pasco</option>
                                <option value="20">Piura</option>
                                <option value="21">Puno</option>
                                <option value="22">San Martín</option>
                                <option value="23">Tacna</option>
                                <option value="24">Tumbes</option>
                                <option value="25">Ucayali</option>

                            </select>
                        </div>

                        <div class="form-group validate-input" data-validate=" Escriba las Observaciones del Conductor">

                            <label for="observacionesconductor"><i class="zmdi zmdi-sign-in"></i> Observaciones del conductor</label>
                            <textarea class="form-control" id="observacionesconductor" rows="3"></textarea>


                        </div>
                        <div class="form-group validate-input" data-validate=" Escriba las Observaciones del Policia">

                            <label for="observacionespolicias"><i class="zmdi zmdi-sign-in"></i> Observaciones del Policia</label>
                            <textarea class="form-control" id="observacionespolicias" rows="3"></textarea>


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
                            <button class="login100-form-btn" onclick="sendAjaxMultas()">
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



                                function sendAjaxMultas() {
                                    event.preventDefault();
                                    if (!validarForm()) {
                                        return;
                                    }
                                    var datos = new Object();
                                    datos.dni = $('#dni').val();
                                    datos.cip = $('#cip').val();
                                    datos.multa = $('#multa').val();
                                    datos.fecha = $('#fecha').val();
                                    datos.placa = $('#placa').val();
                                    datos.direccion = $('#direccion').val();
                                    datos.ubicacion = $('#ubicacion').val();
                                    datos.observacionesconductor = $('#observacionesconductor').val();
                                    datos.observacionespolicias = $('#observacionespolicias').val();

                                    $.ajax({
                                        method: "POST",
                                        url: "RegistroMultas",
                                        data: {
                                            dni: datos.dni,
                                            cip: datos.cip,
                                            multa: datos.multa,
                                            fecha: datos.fecha,
                                            placa: datos.placa,
                                            direccion: datos.direccion,
                                            ubicacion: datos.ubicacion,
                                            observacionesconductor: datos.observacionesconductor,
                                            observacionespolicias: datos.observacionespolicias,

                                        },
                                    })
                                            .done(function (data) {

                                                if (data === "error dni") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'El dni del conductor no existe',
                                                        icon: 'error',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                } else if (data === "error cip") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'El codigo cip no existe',
                                                        icon: 'error',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                } else if (data === "error placa") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'la placa no existe',
                                                        icon: 'error',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                }
                                                else {
                                                    $.toast({
                                                        heading: 'Ok',
                                                        text: 'Multa registrado correctamente',
                                                        icon: 'success',
                                                        loader: false,
                                                        position: 'top-right'
                                                    })
                                                    //$("#formagregarpolicia").reset();
                                                    $('#formulariomultas').trigger("reset");
                                                }
                                            });
                                }
                                ;

        </script>

    </body>

</html>
