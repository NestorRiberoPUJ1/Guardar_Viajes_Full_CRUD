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

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1>Gastos de viaje</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Gasto</th>
					<th>Vendor</th>
					<th>Cantidad</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="gasto" items="${lista_gastos}">
					<tr>
						<td><c:out value="${gasto.getExpense_name()}"/></td>
						<td><c:out value="${gasto.getVendor()}"/></td>
						<td><c:out value="${gasto.getAmount()}"/></td>
						<td>
							<a href="/expenses/edit/${gasto.getId()}" class="btn btn-warning">Editar</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	<a href="expenses/new">Agregar Gasto</a>

	</div>

</body>
</html>