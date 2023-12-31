<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--c:out ; c:forEach etc.-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- formatting (dates -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Audit Manager</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/style.css" />
<script src="/webjars/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body class="body background_image">
	<div class="container text center mx-auto m-5 login_and_reg_box">
			<div class="col p-2 g-col-6 p-4">
				<h1>Big4r</h1>
				<form:form action="/user/register" method="post"
					modelAttribute="user">
					<div class="mb-3">
						<form:label path="userName" class="form-label col">Name:</form:label>
						<form:errors path="userName" class="text-danger" />
						<form:input path="userName" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="email" class="form-label col">Email:</form:label>
						<form:errors path="email" class="text-danger" />
						<form:input path="email" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="password" class="form-label col">Password:</form:label>
						<form:errors path="password" class="text-danger" />
						<form:input path="password" type="password" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="confirmPassword" class="form-label col">Confirm Password:</form:label>
						<form:errors path="confirmPassword" class="text-danger" />
						<form:input path="confirmPassword" type="password" class="form-control" />
					</div>
					<div class="display_flex">
						<button type="submit" class="btn btn-primary" value="submit_form">Submit</button>
					</div>
				</form:form>
				<div class="header header_line_group">
					<p>Have an account?</p>				
					<a class="link-primary"
						href="/">Login here</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
