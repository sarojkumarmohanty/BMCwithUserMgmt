<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/3f5992c71f.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css" />

<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

</head>
<body>
	<div class="container mt-5">

		<div style="width:350px">
			<c:if test="${not empty msg}">
				<p class="alert alert-danger">${msg}</p>
				<c:remove var="msg" scope="session" />
			</c:if>
		</div>

		<div class="text-primary h5">Login Form</div>
		<form class="form-group" method="post" action="./login" id="loginform"
			onsubmit="return validateLoginForm();">
			<div class="row">
				<div class="col-md-4">

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupPrepend"><i
								class="fa-solid fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="username"
							id="usernameId" aria-describedby="inputGroupPrepend" >
						<div class="invalid-feedback">Please choose a username.</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 mt-3">

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupPrepend"><i
								class="fa-solid fa-key"></i></span>
						</div>
						<input type="text" class="form-control" name="password"
							id="passwordId" aria-describedby="inputGroupPrepend" required>
						<div class="invalid-feedback">Please choose a username.</div>
					</div>
				</div>
			</div>

			<div class="mt-3">
				<input type="submit" value="Login" class="btn btn-success">
				<a href="http://localhost:8080/BMCwithUserMgmt/createUser">New User Sign Up</a>
			</div>
		</form>
	</div>
</body>
</html>