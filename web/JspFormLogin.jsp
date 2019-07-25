<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
						<a href="./index.html" class="btn btn-outline-light"><< Inicio</a>

					
					

				</div>
			</nav>
		</div>


		<div class="container-login100" style="background-image: url('./assets/images/bg-02.jpg');">
			<div class="wrap-login100">
                            
                                                                
                            
				<form id="formulariologin" class="login100-form validate-form formulario" action="LoginUserController" method="POST">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Iniciar Sesión
					</span>

					<div class="wrap-input100 validate-input" data-validate="Ingresa tu Usuario">
						<input class="input100" id="idusuario" type="text" name="alias" placeholder="Usuario">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Ingresa tu Contraseña">
						<input class="input100" id="idcontrasena" type="password" name="password" placeholder="Contraseña">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="registrarconductores" onclick="sendAjax()" type="submit">
							Ingresar
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="#">
							Tus datos serán encriptados
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
                        function sendAjax() {
                            event.preventDefault();
                            if(!validarForm()) {
                                return;
                            }
                            var datos = new Object();
                            datos.usuario = $('#idusuario').val();
                            datos.contrasena = $('#idcontrasena').val();
                            $.ajax({
                                method: "POST",
                                url: "LoginUserController",
                                data: {
                                    alias: datos.usuario,
                                    password: datos.contrasena,
                                },
                            })
                                    .done(function (data) {
                                        if (data === "error") {
                                            $.toast({
                                                heading: 'Error',
                                                text: 'El Usuario o Contraseña son incorrectos',
                                                icon: 'error',
                                                loader: false,
                                                position : 'top-right'
                                            })
                                        } else {
                                            $("#formulariologin").submit();
                                        }
                                    });
                        };
        </script>

</body>

</html>




