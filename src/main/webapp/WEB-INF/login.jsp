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
	<div class="header text-center">
    <h1 class="blue_text">Big 4 Audit Manager</h1>
	</div>
	<div class="container text center mx-auto m-5">
        <div class="row column-gap-5">
            <div class="col p-2 g-col-6 p-4">
            <h2 class="text-primary">Register</h2>
            <form:form action="/user/register" method="post" modelAttribute="user">
            <div class="mb-3 row">
            <form:label path="userName" class="form-label col">Name:</form:label>
    		<form:errors path="userName" class="text-danger"/>
    		<form:input path="userName" class="col"/>
    		</div>
    		<div class="mb-3 row">    		
            <form:label path="email" class="form-label col">Email:</form:label>
    		<form:errors path="email" class="text-danger"/>
    		<form:input path="email" class="col"/>
    		</div>
    		<div class="mb-3 row">
    		<form:label path="password" class="form-label col">Password:</form:label>
    		<form:errors path="password" class="text-danger"/>
    		<form:input path="password" type="password" class="col"/>
    		</div>
    		<div class="mb-3 row">
    		<form:label path="confirmPassword" class="form-label col">Confirm Password:</form:label>
    		<form:errors path="confirmPassword" class="text-danger"/>
    		<form:input path="confirmPassword" type="password" class="col"/>
    		</div>
    		<div class="mb-3 row">
 		 	<button type="submit" class="btn btn-primary" value="submit_form">Submit</button>
 		 	</div>
            </form:form>
         	</div>
        	<div class="col p-2 g-col-6 p-4">
        	<h2 class="text-success">Login</h2>
        	<form:form action="/user/login" method="post" modelAttribute="loginUser">
        	<div class="mb-3 row">
            <form:label path="email" class="form-label col">Email:</form:label>
    		<form:errors path="email" class="text-danger"/>
    		<form:input path="email" class="col"/>
    		</div>
    		<div class="mb-3 row">
    		<form:label path="password" class="form-label col">Password:</form:label>
    		<form:errors path="password" class="text-danger"/>
    		<form:input path="password" type="password" class="col"/>
    		</div>    
    		<div class="mb-3 row">
 		 	<button type="submit" class="btn btn-primary" value="submit_form">Submit</button>
 		 	</div> 	
        	</form:form> 	
            </div>


        </div>
    </div>
    
</body>
</html>
