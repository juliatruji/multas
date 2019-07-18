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
    String dniadmin = currentUser.getDni();
    //out.println(currentUser.getNombre());
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
						<a class="btn btn-light dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="zmdi zmdi-account"></i> <%= nombreadmin %>
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
				<form class="login100-form validate-form">
					<!-- <span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span> -->

					<span class="login100-form-title p-b-34 p-t-27">
							<i class="zmdi zmdi-account"></i> Bienvenid@ Admin
					</span>
                                        <span class="login100-form-title p-b-34 p-t-27">
                                                <%= nombreadmin %> <%= apellidosadmin %>
					</span>
                                        <span class="login100-form-title p-b-34 p-t-27">
                                                DNI: <%= dniadmin %>
					</span>

					
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

</body>

</html>