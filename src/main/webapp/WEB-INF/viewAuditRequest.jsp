<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--c:out ; c:forEach etc.-->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- formatting (dates -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Audit Manager</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/style.css">
<script type="text/javascript" src="/script.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="header">
		<div class="header_line_group">
			<h1>Big4 Audit Manager</h1>
			<a href="/requests">Home</a> <a href="/logout">Logout</a>
		</div>
		<div class="header_box_justified">
			<h2>Request</h2>
		</div>
	</div>
	<div class="container form_box border border-dark">
		<div class="row">
			<p class="col">
				<strong>Request: </strong>
			</p>
			<p class="col">
				<strong><c:out value="${auditRequest.user.userName}" /><c:out value="${auditRequest.request}" /></strong>
			</p>
			<p class="col">
				<strong>Status: </strong>
			</p>
			<p class="col">
				<strong><c:out value="${auditRequest.status}"/></strong>
			</p>
		</div>
		<div class="row">
			<p class="col">Details:</p>
			<p class="col">
				<c:out value="${auditRequest.details}" />
			</p>
		</div>
		<div class="row">
			<p class="col">Due Date:</p>
			<p class="col">
				<c:out value="${auditRequest.dueDate}" />
			</p>
		</div>
	</div>
	<div class="form_box">
		<c:choose>
			<c:when test="${auditRequest.user.id == userId}">
				<form action="/requests/${auditRequest.id}/edit">
					<button type="submit" class="btn btn-primary" value="submit_form">Edit</button>
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="container form_box border border-dark">
		<h2>Comments</h2>
		<c:forEach var="comments" items="${comments}">
				<p>${comments.text}</p>
		</c:forEach>
		<form:form action="/requests/${auditRequest.id}/createComment" method="post" modelAttribute="comment">
			<form:label path="text">Add a Comment:</form:label>
			<form:errors path="text" class="text-danger" />
			<form:textarea path="text" rows="3" class="col" />
			<button type="submit" class="btn btn-primary" value="submit_form">Post Comment</button>
		</form:form>
	</div>
</body>
</html>
