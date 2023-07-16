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
<body>
	<div class="header">
		<div class="header_line_group">
			<h1>Big4 Audit Manager</h1>
			<a href="/requests">Home</a> <a href="/logout">Logout</a>
		</div>
		<div class="header_box_justified">
			<h2>New Request</h2>
		</div>
	</div>
	<div class="form_box">
		<form:form action="/requests/create" method="post" modelAttribute="auditRequest">
			<div class="mb-3 row">
				<form:label path="request" class="form-label col">Request:</form:label>
				<form:errors path="request" class="text-danger" />
				<form:input path="request" class="col" />
			</div>
			<div class="mb-3 row">
				<form:label path="details" class="form-label col">Details:</form:label>
				<form:errors path="details" class="text-danger" />
				<form:textarea path="details" rows="3" class="col" />
			</div>
			<div class="mb-3 row">
				<form:label path="dueDate" class="form-label col">Due Date:</form:label>
				<form:errors path="dueDate" class="text-danger" />
				<form:input path="dueDate" type="date" class="col" />
			</div>
			<div class="mb-3 row">
				<form:label path="accountType" class="form-label col">Account Type:</form:label>
				<form:errors path="accountType" class="text-danger" />
				<form:select path="accountType" class="col">
					<form:option value="" label="--- Select Account Type ---"/>
					<form:option value="Assets" label="Assets"/>
					<form:option value="Liabilities" label="Liabilities"/>
					<form:option value="Equity" label="Equity"/>
					<form:option value="Revenue" label="Revenue"/>
					<form:option value="Expenses" label="Expenses"/>
				</form:select>
			</div>
			<div class="mb-3 header_line_group">
				<form:input path="requestUser" type="hidden" value="${user.id}" />
				<a href="/requests" class="btn btn-danger">Cancel</a>
				<button type="submit" class="btn btn-primary" value="submit_form">Create Request</button>
			</div>
		</form:form>
	</div>
</body>
</html>
