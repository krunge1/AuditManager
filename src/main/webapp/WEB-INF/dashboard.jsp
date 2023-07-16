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
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/style.css"/>
	<script type="text/javascript" src="/script.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="header">
		<div class="header_line_group">
			<h1>Big4 Audit Manager</h1>
			<a href="/requests/new">New Request</a> <a href="/logout">Logout</a>
		</div>
	</div>
	<div class="header_box_sizing">
		<h2>Assets</h2>
	</div>
	<div class="box_sizing">
		<table class="table table-striped table-dark border border-dark">
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
							<!-- Display asset audit request details -->
							<td><a href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
							<td>${auditRequest.dueDate}</td>
							<td>${auditRequest.status}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="header_box_justified">
			<h2>Liabilities</h2>
		</div>
		<div class="box_sizing">
			<table class="table table-striped table-dark border border-dark">
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
								<!-- Display asset audit request details -->
								<td><a href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
								<td>${auditRequest.dueDate}</td>
								<td>${auditRequest.status}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="header_box_justified">
			<h2>Equity</h2>
		</div>
		<div class="box_sizing">
			<table class="table table-striped table-dark border border-dark">
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
								<!-- Display asset audit request details -->
								<td><a href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
								<td>${auditRequest.dueDate}</td>
								<td>${auditRequest.status}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="header_box_justified">
			<h2>Revenue</h2>
		</div>
		<div class="box_sizing">
			<table class="table table-striped table-dark border border-dark">
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
								<!-- Display asset audit request details -->
								<td><a href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
								<td>${auditRequest.dueDate}</td>
								<td>${auditRequest.status}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="header_box_justified">
			<h2>Expenses</h2>
		</div>
		<div class="box_sizing">
			<table class="table table-striped table-dark border border-dark">
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
								<!-- Display asset audit request details -->
								<td><a href="/requests/${auditRequest.id}">${auditRequest.request}</a></td>
								<td>${auditRequest.dueDate}</td>
								<td>${auditRequest.status}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
