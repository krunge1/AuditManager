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
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
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
	<p class="col"><strong>Request: </strong></p>
	<p class="col"><strong><c:out value="${auditRequest.user.userName}"/></strong></p>
	</div>
	<div class="row">
	<p class="col">Details: </p>
	<p class="col"><c:out value="${auditRequest.details}"/></p>
	</div>
	<div class="row">
	<p class="col">Due Date: </p>
	<p class="col"><c:out value="${auditRequest.dueDate}"/></p>
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
</body>
</html>
