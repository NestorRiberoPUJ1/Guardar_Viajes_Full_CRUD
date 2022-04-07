<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Ver gasto</title>
</head>
<body>

	<div class="container">
		<h1>Detalles del Gasto</h1>
		<h4>
			Expense Name:
			<c:out value="${gasto.getExpense_name()}" />
		</h4>
		<h4>
			Expense Description:
			<c:out value="${gasto.getDescription()}" />
		</h4>
		<h4>
			Vendor:
			<c:out value="${gasto.getVendor()}" />
		</h4>
		<h4>
			Amount Spent:
			<c:out value="${gasto.getAmount()}" />
		</h4>
		
		<a href="/expenses">Volver</a>

	</div>

</body>
</html>