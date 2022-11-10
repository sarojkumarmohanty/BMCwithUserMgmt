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
				<div class="h3">Un-approved User List</div>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Sl#</th>
							<th>User Id</th>
							<th>User Name</th>
							<th>email</th>
							<th>Phone no</th>
							<th>Aadhar</th>
							<th>Action</th>
						</tr>
					
					</thead>
					<tbody>
						<c:forEach var="usr" items="${uaUserList}" varStatus="counter">
						<tr>
							<td>${counter.count}</td>
							<td>${usr.userId}</td>
							<td>${usr.userName}</td>
							<td>${usr.email}</td>
							<td>${usr.phoneNo}</td>
							<td><a href="http://localhost:8080/BMCwithUserMgmt/download?file_path=${usr.aadharIdPath}">download</a></td>
							<td><a class="btn btn-info" href="#">Appr</a></td>
						</tr>
						</c:forEach>
					
					</tbody>
				
				
				</table>
			
			</div>
		</c:when>
	</c:choose>


</body>
</html>