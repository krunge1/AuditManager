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
<link rel="stylesheet" type="text/css" href="/style.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body class="body">
	<div class="background_image text-bg-primary p-3">
		<div class="d-flex justify-content-around header">
			<h1 class="">Big4 Audit Manager</h1>
			<div class="grid gap-0 column-gap-3 header_line_group">
				<a
					class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover"
					href="/requests/new">New Request</a> 
				<a
					class="p-2 g-col-6 link-light link-offset-2 link-underline link-underline-opacity-0 link-underline-opacity-100-hover"
					href="/logout">Logout</a>
			</div>
		</div>
	</div>
	<div class="container-md">
		<h2 class="text-decoration-underline">Assets</h2>
		<table class="table table-striped table-light border border-dark">
			<thead>
				<tr>
					<th>Request</th>
					<th>Due Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auditRequest" items="${auditRequest}">
					<c:if test="${auditRequest.accountType eq 'Assets'}">
						<tr>
							<td><a
								class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
								href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td><fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>${formattedDueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h2 class="text-decoration-underline">Liabilities</h2>
		<table class="table table-striped table-light border border-dark">
			<thead>
				<tr>
					<th>Request</th>
					<th>Due Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auditRequest" items="${auditRequest}">
					<c:if test="${auditRequest.accountType eq 'Liabilities'}">
						<tr>
							<td><a
								class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
								href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td><fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>${formattedDueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h2 class="text-decoration-underline">Equity</h2>
		<table class="table table-striped table-light border border-dark">
			<thead>
				<tr>
					<th>Request</th>
					<th>Due Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auditRequest" items="${auditRequest}">
					<c:if test="${auditRequest.accountType eq 'Equity'}">
						<tr>
							<td><a
								class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
								href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td><fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>${formattedDueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h2 class="text-decoration-underline">Revenue</h2>
		<table class="table table-striped table-light border border-dark">
			<thead>
				<tr>
					<th>Request</th>
					<th>Due Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auditRequest" items="${auditRequest}">
					<c:if test="${auditRequest.accountType eq 'Revenue'}">
						<tr>
							<td><a
								class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
								href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td><fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>${formattedDueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<h2 class="text-decoration-underline">Expenses</h2>
		<table class="table table-striped table-light border border-dark">
			<thead>
				<tr>
					<th>Request</th>
					<th>Due Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="auditRequest" items="${auditRequest}">
					<c:if test="${auditRequest.accountType eq 'Expenses'}">
						<tr>
							<td><a
								class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"
								href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td><fmt:formatDate value="${auditRequest.dueDate}" pattern= "MM/dd/yyyy" var="formattedDueDate"/>${formattedDueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
