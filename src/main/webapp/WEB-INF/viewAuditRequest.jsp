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
			<form:form action="/requests/${id}/statusUpdate" method="put" modelAttribute="auditRequest">
				<form:select path="status" class="col">
					<form:option value="Open" label="Open"/>
					<form:option value="In-Progress" label="In-Progress"/>
					<form:option value="Complete" label="Complete"/>
				</form:select>
				<form:input path="request" type="hidden" value="${auditRequest.request}" />
				<form:input path="details" type="hidden" value="${auditRequest.details}" />
				<form:input path="dueDate" type="hidden" value="${auditRequest.dueDate}" />
				<form:input path="accountType" type="hidden" value="${auditRequest.accountType}" />
				<form:input path="user" type="hidden" value="${auditRequest.user.id}" />
				
				<button type="submit" class="btn btn-primary" value="submit_form">Update Status</button>
			</form:form>
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
		<form:form action="/requests/${auditRequest.id}/addComment" method="post" modelAttribute="${comment}">
			<form:label path="text">Add a Comment:</form:label>
			<form:textarea path="text" rows="3" class="col" />
			<button type="submit" class="btn btn-primary" value="submit_form">Post Comment</button>
		</form:form>
	</div>
</body>
</html>
