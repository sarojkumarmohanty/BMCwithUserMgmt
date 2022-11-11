<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Birth Certificate Application Form</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<script src="https://kit.fontawesome.com/3f5992c71f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<c:choose>

		<c:when test="${not empty loggedInUser}">
			<%@include file="top_menu.jsp"%>
			<div>
				<c:if test="${not empty msg}">
					<p class="alert alert-success">${msg}</p>
					<c:remove var="msg" scope="session" />
				</c:if>
			</div>

			<div class="container mt-5">
				<div class="h3">Birth Certificate Application Form</div>
				<form class="form-group" method="post"
					action="./applyBirthCertificate" id="birthCertificateform"
					enctype="multipart/form-data" onsubmit="return validateRegdForm();">

					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Child Name<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="childname" id="childNameId"
								class="form-control">
						</div>
						<div class="col-md-2">
							<lable class="text-warning font-weight-bold">Date/Time of
							Birth<sup class="text-danger">*</sup></lable>
							<input type="text" name="dob" id="dobId" class="form-control">
						</div>
						<div class="col-md-2">
							<lable class="text-warning font-weight-bold">Blook Group<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="bloodgroup" id="bloodgroupId"
								class="form-control">
						</div>
						<div class="col-md-2">
							<lable class="text-warning font-weight-bold">Child Weight<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="weight" id="weightId"
								class="form-control">
						</div>
						<div class="col-md-2">
							<lable class="text-warning font-weight-bold">Gender<sup
								class="text-danger">*</sup></lable>
							<div>
								<input type="radio" name="gender" id="genderId" value="M">
								Male <input type="radio" name="gender" id="genderId" value="F">
								Fe-Male
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Hospital
							Name<sup class="text-danger">*</sup></lable>
							<input type="text" name="hospitalname" id="hospitalnameId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Hospital Doc<sup
								class="text-danger">*</sup></lable>
							<input type="file" name="hospitaldocfile" id="hospitaldocfile">
						</div>
					</div>
					<div class="row" style="margin-top: 20px">
						<div class="col-md-3">
							<lable class="text-warning font-weight-bold">Father Name<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="fathername" id="fathernameId"
								class="form-control">
						</div>
						<div class="col-md-3">
							<lable class="text-warning font-weight-bold">Mohter Name<sup
								class="text-danger">*</sup></lable>
							<input type="text" name="mothername" id="mothernameId"
								class="form-control">
						</div>
						<div class="col-md-4">
							<lable class="text-warning font-weight-bold">Address<sup
								class="text-danger">*</sup></lable>
							<textarea name="address" id="addressId" class="form-control"></textarea>
						</div>
						<div class="col-md-2">
							<lable class="text-warning font-weight-bold">Address
							Proof<sup class="text-danger">*</sup></lable>
							<input type="file" name="addressproof" id="addressproofId">
						</div>
					</div>
					<div class="text-center" style="margin-top: 15px">
						<input type="submit" value="Apply" class="btn btn-success">
						<input class="btn btn-warning" type="reset" value="Reset">
					</div>


				</form>

				<div>
					<div class="h3">Birth Certificate Application List</div>
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Sl#</th>
								<th>Child Name</th>
								<th>DOB</th>
								<th>Hospital Name</th>
								<th>Status</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="app" items="${appList}" varStatus="counter">
								<tr>
									<td>${counter.count}</td>
									<td>${app.childName}</td>
									<td><fmt:formatDate pattern="dd/MM/yy"
											value="${app.childDob}" /></td>
									<td>${app.hospitaName}</td>

									<c:choose>

										<c:when test="${app.appStatus eq 'APPR'}">
											<td align="center"><a
												href="http://localhost:8080/BMCwithUserMgmt/getCertificate?cId=${app.certificateId}"><i
													class="fa-solid fa-cloud-arrow-down"></i></a></td>
										</c:when>
										<c:otherwise>
											<td>${app.appStatus}</td>
										</c:otherwise>
									</c:choose>
								</tr>


							</c:forEach>

						</tbody>

					</table>




				</div>




			</div>
		</c:when>
	</c:choose>


</body>

<script type="text/javascript">
	$(function() {
		$('#dobId').datetimepicker();
	});
</script>

</html>