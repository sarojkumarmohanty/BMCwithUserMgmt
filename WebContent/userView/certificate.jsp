<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.box{
	width:757px;
	height:912px;
	border:1px solid black;
	background-image: url('https://th.bing.com/th/id/R.27eb1c152b012810473d6f00d00479fe?rik=ITIm5iEPIeRsWw&riu=http%3a%2f%2fclipart-library.com%2fimages%2fyckkaMRcE.jpg&ehk=E5zgA8NbNUbjgsbWfeT%2fJZkf5QU8rRSu%2ftk0%2f%2btQw4A%3d&risl=&pid=ImgRaw&r=0');
}
label{
	font-size: 25px;
	font-family: cursive;
	font-weight: normal;
	color:red;

}
</style>
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
<body >

	<div class="box">
		<div style='margin : 100px;'>
			<div class="display-3 text-primary text-center">Birth Certificate</div>
			
			<p class="h5 text-info text-center">
				This certify that <br><label>${certificate.childName }</label><br>was born to<br> <label>${certificate.fatherName } </label>and <label>${certificate.motherName }</label>
				<br>On this <label>${certificate.childDob }</label> day				
			</p>
		</div>	
	
	</div>


</body>
</html>