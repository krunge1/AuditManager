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
<link rel="stylesheet" type="text/css" href="/style.css">
<script type="text/javascript" src="/script.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body class="body">
	<div class="text-bg-primary p-3">
		<div class="d-flex justify-content-around">
			<h1>Big4 Audit Manager</h1>
			<div class="grid gap-0 column-gap-3 ">
				<a
					class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover"
					href="/requests">Home</a> <a
					class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover"
					href="/logout">Logout</a>
			</div>
		</div>
	</div>
	<div class="container-md form_box mt-3">
		<form:form action="/requests/${id}/edit" method="put"
			modelAttribute="auditRequest">
			<div class="mb-3 row">
				<form:label path="request" class="form-label col text-center">Request:</form:label>
				<form:errors path="request" class="text-danger" />
				<form:input path="request" class="col" />

				<form:label path="status" class="form-label col text-center">Status:</form:label>
				<form:select path="status" class="col">
					<form:option value="Open" label="Open" />
					<form:option value="In-Progress" label="In-Progress" />
					<form:option value="Complete" label="Complete" />
				</form:select>
			</div>
			<div class="mb-3 row">
				<form:label path="details" class="form-label col-5 text-center">Details:</form:label>
				<form:errors path="details" class="text-danger" />
				<form:textarea path="details" rows="3" class="col" />
			</div>
			<div class="mb-3 row">
				<form:label path="dueDate" class="form-label col-5 text-center">Due Date:</form:label>
				<form:errors path="dueDate" class="text-danger" />
				<form:input path="dueDate" type="date" class="col" />
			</div>
			<div class="mb-3 row">
				<form:label path="accountType" class="form-label col-5 text-center">Account Type:</form:label>
				<form:errors path="accountType" class="text-danger" />
				<form:select path="accountType" class="col">
					<form:option value="" label="--- Select Account Type ---" />
					<form:option value="Assets" label="Assets" />
					<form:option value="Liabilities" label="Liabilities" />
					<form:option value="Equity" label="Equity" />
					<form:option value="Revenue" label="Revenue" />
					<form:option value="Expenses" label="Expenses" />
				</form:select>
			</div>
			<div class="d-flex justify-content-evenly">
				<form:input path="requestUser" type="hidden" value="${user.id}" />
				<a href="/requests/${id}" class="btn btn-danger">Cancel</a>
				<button type="submit" class="btn btn-primary" value="submit_form">Update
					Request</button>
			</div>
		</form:form>
	</div>
</body>
</html>
