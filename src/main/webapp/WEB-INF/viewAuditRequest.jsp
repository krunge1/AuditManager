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
<body class="body">
	<div class="text-bg-primary p-3">
		<div class="d-flex justify-content-around header">
			<h1>Big4 Audit Manager</h1>
			<div >
				<a class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="/requests">Home</a> 
				<a class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="/requests/new">New Request</a>
				<a class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="/logout">Logout</a>
			</div>
		</div>
	</div>
	<div class="container-md form_box border border-dark mt-3">
		<div class="row">
			<p class="col-lg-3">
				<strong>Request: </strong>
			</p>
			<p class="col">
				<strong><c:out value="${auditRequest.request}" /></strong>
			</p>
			<p class="col-lg-3">
				<strong>Status: </strong>
			</p>
			<p class="col">
				<strong><c:out value="${auditRequest.status}"/></strong>
			</p>
		</div>
		<div class="row d-flex justify-content-evenly">
			<p class="col">Details:</p>
			<p class="col">
				<c:out value="${auditRequest.details}" />
			</p>
		</div>
		<div class="row d-flex justify-content-evenly">
			<p class="col">Due Date:</p>
			<p class="col">
				<fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>
				<c:out value="${formattedDueDate}" />
			</p>
		</div>
		<div class="container-md mt-3 d-flex grid gap-3">
			<c:choose>
				<c:when test="${auditRequest.requestUser.id == userId}">
					<form action="/requests/${auditRequest.id}/edit">
						<button type="submit" class="btn btn-primary p-2 g-col-6" value="submit_form">Edit</button>
					</form>
					<form action="/requests/${auditRequest.id}/delete">
						<button type="submit" class="btn btn-danger p-2 g-col-6" value="submit_form">Delete</button>
					</form>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="container-md form_box mt-3 grid gap-3">
		<h2 class="text-decoration-underline mt-5">Comments</h2>
		<c:forEach var="requestComments" items="${requestComments}">
				<p>${requestComments.text} <span class="fw-bold">${requestComments.commentUser.userName}</span></p>
		</c:forEach>
		<form:form action="/requests/${auditRequest.id}/createComment" method="Post" modelAttribute="comment">
			<form:errors path="text" class="text-danger" />
			<form:textarea path="text" rows="3" class="col-lg-6" />
			<button type="submit" class="btn btn-primary mt-3 d-flex" value="New_Comment">Post Comment</button>
		</form:form>
	</div>
	<div class="container-md form_box mt-5 grid gap-3">
       		<h2 class="text-decoration-underline mt-5">Uploaded Files</h2>
	     <form:form action="/requests/${auditRequest.id}/uploadFile" method = "post"
	         enctype = "multipart/form-data">
	        <input type="file" name="file" class="form-control form-control-lg "/>
	        <input type = "submit" value = "Upload File" class="btn btn-primary mt-3 d-flex"/>
         </form:form>
			<c:forEach var="requestFiles" items="${requestFiles}">
					<a href="/${requestFiles.name}" download class="d-block p-2">${requestFiles.name}</a>
			</c:forEach>
	</div>
	

</body>
</html>
