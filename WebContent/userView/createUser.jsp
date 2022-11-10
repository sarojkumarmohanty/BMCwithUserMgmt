<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Regd. Form</title>
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
	<c:choose>
		<c:when test="${not empty loggedInUser}">
			<%@include file="top_menu.jsp"%>
			<div class="container mt-5">

				<div>
					<c:if test="${not empty msg}">
						<p class="alert alert-success">${msg}</p>
						<c:remove var="msg" scope="session" />
					</c:if>
				</div>

				<h3 class="text-primary">User Regd. Form</h3>
				<form class="form-group" method="post" action="./saveUser"
					id="regdform" enctype="multipart/form-data"
					onsubmit="return validateRegdForm();">

					<!-- <input type="hidden" name="rollNo" > -->

					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">User Id<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="userid" id="userId" class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">User Name<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="username" id="usernameId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Password<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="password" id="passwordId"
								class="form-control">
						</div>

					</div>


					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Email<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="email" id="emailId" class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Phone No</lable>
							<input type="text" name="phoneno" id="phonenoId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Aadhar No</lable>
							<input type="text" name="aadharno" id="aadharnoId"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Aadhar Image</lable>
							<input type="file" name="aadharfile" id="aadharfileId">
						</div>


						<div class="col-md-3">
							<lable class="text-warning font-weight-bold">Role</lable>
							<select class="form-control" name="role" id="roleId">
								<option value="0">-select-</option>
								<c:forEach var="rol" items="${roleList}">
									<option value="${rol.roleId}">${rol.roleName }</option>
								</c:forEach>
							</select>

						</div>

					</div>

					<div class="text-center mt-3">
						<input type="submit" name="collegeName" id="collegeNameId"
							class="btn btn-success"> <input class="btn btn-warning"
							type="reset" value="Reset">
					</div>
				</form>




			</div>
		</c:when>
		<c:otherwise>
			<div class="container mt-5">
				<h3 class="text-primary">User Regd. Form</h3>
				<form class="form-group" method="post" action="./saveUser"
					id="regdform" enctype="multipart/form-data"
					onsubmit="return validateRegdForm();">

					<!-- <input type="hidden" name="rollNo" > -->

					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">User Id<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="userid" id="userId" class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">User Name<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="username" id="usernameId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Password<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="password" id="passwordId"
								class="form-control">
						</div>

					</div>


					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Email<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="email" id="emailId" class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Phone No</lable>
							<input type="text" name="phoneno" id="phonenoId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Aadhar No</lable>
							<input type="text" name="aadharno" id="aadharnoId"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Aadhar Image</lable>
							<input type="file" name="aadharfile" id="aadharfileId">
						</div>


						<div class="col-md-3">
							<lable class="text-warning font-weight-bold">Role</lable>
							<select class="form-control" name="role" id="roleId">
								<option value="0">-select-</option>
								<c:forEach var="rol" items="${roleList}">
									<c:if test="${rol.roleId eq 3}">
										<option value="${rol.roleId}">${rol.roleName }</option>
									</c:if>
								</c:forEach>
							</select>

						</div>

					</div>

					<div class="text-center mt-3">
						<input type="submit" name="collegeName" id="collegeNameId"
							class="btn btn-success"> <input class="btn btn-warning"
							type="reset" value="Reset">
					</div>
				</form>

			</div>
		</c:otherwise>
	</c:choose>
</body>

<script type="text/javascript">
	$(function() {
		$("#student_data").dataTable();
	});

	$(document).ready(function() {
		$(".dp").datepicker({
			"format" : "yyyy-m-d"/* ,
														"startDate": "-5m",
														"endDate": "05-15-2020", */
		}

		);
	});

	function getBranchFee() {
		var bId = $('#branchId').val();
		$.ajax({
			url : "./getFeeByBranchId",
			type : "GET",
			data : {
				branchId : bId
			},
			success : function(result) {

				$("#fid").text(result);
			}
		});

	}

	function getStates() {
		var cId = $('#countryId').val();

		$.ajax({
			url : "./getStates",
			type : "GET",
			data : {
				countryId : cId
			},
			success : function(result) {

				$("#stateId").html(result);
			}
		});

	}

	function getCities() {

		var sId = $('#stateId').val();

		$.ajax({
			url : "./getCities",
			type : "GET",
			data : {
				stateId : sId
			},
			success : function(result) {

				$("#cityId").html(result);
			}
		});

	}

	function validateRegdForm() {
		var name = $("#nameId").val();
		var phone = $("#phoneId").val();
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		var email = $("#emailId").val();
		var college = $("#collegeNameId").val();
		var branch = $("#branchId option:selected").val();
		var cgpa = $("#cgpaId").val();
		var dob = $("#dobId").val();

		if (name.length < 5) {
			alert("student name should not be less than 5 character long");
			$("#nameId").focus();
			return false;
		}

		else if (!email.match(emailPattern)) {
			alert("email is not valid");
			$("#emailId").focus();
			return false;
		} else if (isNaN(phone) || phone.length != 10) {
			alert("phone no is not a number or less than 10 digits");
			$("#phoneId").focus();
			return false;
		} else if (college == "") {
			alert("privide a college name");
			$("#collegeNameId").focus();
			return false;
		} else if (branch == 0) {
			alert("select a branch");
			return false;
		} else if (!(cgpa >= 0 && cgpa <= 10)) {
			alert("cgpa must be less than 10");
			return false;
		}

		else if (!(new Date().getFullYear() - new Date(dob).getFullYear() >= 15)) {

			alert("age must be greater than 15 years");
			return false;

		} else if (typeof $("input[name='studType']:checked").val() === "undefined") {
			alert("student type must be selected");
			return false;

		} else if (!($('#regdform :checkbox:checked').length >= 1)) {
			alert("must check atleast one interest area");
			return false;
		}

		return true;

	}
</script>
</html>