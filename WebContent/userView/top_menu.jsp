	<nav class="navbar navbar-expand-sm bg-info">
		<div class="container">
			<a class="navbar-brand text-dark" href="#">${loggedInUser.userName}</a>
			<ul class="navbar-nav">
				<c:choose>
					<c:when test="${loggedInUser.role.roleId eq 1}">
						<li class="nav-item"><a class="nav-link text-dark" href="http://localhost:8080/BMCwithUserMgmt/approveUser">Approve
								User</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="http://localhost:8080/BMCwithUserMgmt/createUser">Create
								Officers</a></li>
					</c:when>
					<c:when test="${loggedInUser.role.roleId eq 2}">
						<li class="nav-item"><a class="nav-link text-dark" href="http://localhost:8080/BMCwithUserMgmt/approveBirthCertificate">Approve</a></li>
					</c:when>
					<c:when test="${loggedInUser.role.roleId eq 3}">
						<li class="nav-item"><a class="nav-link text-dark" href="http://localhost:8080/BMCwithUserMgmt/getbirthcertificateform">Apply</a></li>
					</c:when>
				</c:choose>
				<li class="nav-item"><a class="nav-link text-dark" href="http://localhost:8080/BMCwithUserMgmt/logOut">LogOut</a></li>
			</ul>
		</div>
	</nav>
