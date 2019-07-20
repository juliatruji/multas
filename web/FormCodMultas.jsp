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
                                <a class="dropdown-item" href="/FormVehiculos.jsp"><i class="zmdi zmdi-car"></i> Reportes policia</a>
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
                    <form id="formulariocodmultas" class="login100-form validate-form" action="RegistroCodMultas" method="POST">
                        <!-- <span class="login100-form-logo">
                                <i class="zmdi zmdi-landscape"></i>
                        </span> -->

                        <span class="login100-form-title p-b-34 p-t-27">
                            <i class="zmdi zmdi-account-add"></i> Registro de Códigos de Multas de Tránsito
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="Escribe el codigo de la falta">
                            <input id="codfalta" class="input100" type="text" name="codfalta" placeholder="Escriba el codigo de la falta">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        <div class="form-group validate-input" data-validate="Escriba la descripcion">

                            <label for="exampleFormControlTextarea1"><i class="zmdi zmdi-sign-in"></i> Descripcion de la falta</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>


                        </div>

                        <div class="doblecolumn">
                            <div class="form-group validate-input" data-validate="Elige la Clasificacion">
                                <label for="clasificacion"><i class="zmdi zmdi-sign-in"></i>
                                    Clasificacion</label>
                                <select id="clasificacion" class="form-control formulariosselect" name="clasificacion">
                                    <option value="">Seleccione la Clasificacion</option>
                                    <option value="L">Leve</option>
                                    <option value="G">Grave</option>
                                    <option value="M">Muy grave</option>
                                </select>
                            </div>
                            <div class="form-group validate-input" data-validate="Elige el descuento">
                                <label for="descuento"><i class="zmdi zmdi-sign-in"></i>
                                    Descuento</label>
                                <select id="descuento" class="form-control formulariosselect" name="descuento">
                                    <option value="">Descuento</option>
                                    <option value="S">Si</option>
                                    <option value="N">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="doblecolumn">
                            <div class="wrap-input100 validate-input" data-validate="Escribe el monto UIT">
                                <input id="montouit" class="input100" type="number" name="montouit" placeholder="Escribe el monto UIT">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Escribe los puntos">
                                <input id="puntos" class="input100" type="number" name="puntos" placeholder="Escriba los puntos">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                        </div>
                        <div class="form-group validate-input" data-validate="Elige la Sancion">
                            <label for="sancion"><i class="zmdi zmdi-sign-in"></i>
                                Sancion</label>
                            <select id="sancion" class="form-control formulariosselect" name="sancion">
                                <option value="">Sancion</option>
                                <option value="11">Ninguna</option>
                                <option value="1">Multa y cancelacion de la licencia e inhabilitacion definitiva para obtener licencia</option>
                                <option value="2">Multa y suspension de la licencia de conducir por tres años</option>
                                <option value="3">Multa e inhabilitacion para obtener licencia por 3 años</option>
                                <option value="4">Multa y suspension de licencia por 3 años si estuviese retenida o multa y cancelacion definitiva de licencia si ella estuviera suspendida</option>
                                <option value="5">Multa y suspesion de la licencia por 1 año</option>
                                <option value="6">Multa</option>
                                <option value="7">Suspension de licencia por 3 años</option>
                                <option value="8">Suspension de licencia por 1 año</option>
                                <option value="9">Cancelacion e inhabilitacion definitiva del conductor para obtener una licencia</option>

                            </select>
                        </div>
                        <div class="form-group validate-input" data-validate="Elige la medida preventiva">
                            <label for="medidapreventiva"><i class="zmdi zmdi-sign-in"></i>
                                Medida Preventiva</label>
                            <select id="medidapreventiva" class="form-control formulariosselect" name="medidapreventiva">
                                <option value="">Medida Preventiva</option>
                                <option value="7">Ninguna</option>
                                <option value="1">Internamiento del Vehiculo y Retencion de la Licencia</option>
                                <option value="2">Internamiento del vehiculo</option>
                                <option value="3">Remoción del vehículo</option>
                                <option value="4">Retención del vehículo y retención de la licencia de conducir</option>
                                <option value="5">Internamiento</option>
                                <option value="8">Retencion del vehiculo</option>                                
                            </select>
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
                                    datos.codfalta = $('#codfalta').val();
                                    datos.descripcion = $('#descripcion').val();
                                    datos.clasificacion = $('#clasificacion').val();
                                    datos.descuento = $('#descuento').val();
                                    datos.montouit = $('#montouit').val();
                                    datos.puntos = $('#puntos').val();
                                    datos.sancion = $('#sancion').val();
                                    datos.medidapreventiva = $('#medidapreventiva').val();

                                    $.ajax({
                                        method: "POST",
                                        url: "RegistroCodMultas",
                                        data: {
                                            codfalta: datos.codfalta,
                                            descripcion: datos.descripcion,
                                            clasificacion: datos.clasificacion,
                                            descuento: datos.descuento,
                                            montouit: datos.montouit,
                                            puntos: datos.puntos,
                                            sancion: datos.sancion,
                                            medidapreventiva: datos.medidapreventiva,

                                        },
                                    })
                                            .done(function (data) {

                                                if (data === "error codigo") {
                                                    $.toast({
                                                        heading: 'Error',
                                                        text: 'El codigo de multa ingresado ya existe',
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
                                                    $('#formulariocodmultas').trigger("reset");
                                                }
                                            });
                                }
                                ;

        </script>

    </body>

</html>


