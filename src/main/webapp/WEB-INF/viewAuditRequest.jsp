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
				<strong><c:out value="${auditRequest.requestUser.userName}" /><c:out value="${auditRequest.request}" /></strong>
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
			<c:when test="${auditRequest.requestUser.id == userId}">
				<form action="/requests/${auditRequest.id}/edit">
					<button type="submit" class="btn btn-primary" value="submit_form">Edit</button>
				</form>
			</c:when>
		</c:choose>
	</div>
	<div class="container form_box border border-dark">
		<h2>Comments</h2>
		<c:forEach var="requestComments" items="${requestComments}">
				<p>${requestComments.text}</p>
		</c:forEach>
		<form:form action="/requests/${auditRequest.id}/createComment" method="Post" modelAttribute="comment">
			<form:label path="text">Add a Comment:</form:label>
			<form:errors path="text" class="text-danger" />
			<form:textarea path="text" rows="3" class="col" />
			<button type="submit" class="btn btn-primary" value="New_Comment">Post Comment</button>
		</form:form>
			<div class="container form_box border border-dark">
	     <form:form action="/requests/${auditRequest.id}/uploadFile" method = "post"
	         enctype = "multipart/form-data">
	        <input type="file" name="file" />
	        <input type = "submit" value = "Upload File" />
         </form:form>
       		<h2>Files</h2>
			<c:forEach var="requestFiles" items="${requestFiles}">
					<a href="/requests/${requestFiles.name}" download>${requestFiles.name}</a>
			</c:forEach>
	</div>
		
	</div>

</body>
</html>
