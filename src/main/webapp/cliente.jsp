<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="component/allhead.jsp" %>
<link rel="stylesheet" href="css/cliente.css">
</head>
<body>
	<jsp:include page="component/sidebar.jsp"></jsp:include>

	<section class="home-section">
		<div class="home-content">
			<i class='bx bx-menu'></i>
			<div style="display: inline-block;">
				<span class="text">Clientes</span>
				<jsp:include page="component/spinner.jsp"></jsp:include>
			</div>	

			<div class="container overflow-auto" style="height: 100vh;">


				<div class="p-3 my-3 rounded shadow-sm">
					<div class="row g-3 pt-3">
						<div class="col-md-11">
							<div class="input-group pe-5">
		  						<span class="input-group-text bg-border-white"><i class="bx bx-search-alt-2"></i></span>
							  	<input type="search" class="form-control" placeholder="Buscar..." id="idBuscarCliente">
							</div>
						</div>
						<div class="col-md-1">
							<button type="button" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">Nuevo</button>
						</div>
					</div>
				</div>

				<div class="p-3 my-3 rounded shadow-sm bg-body overflow-auto">
					<table class="table table-sm table-hover" style="with: 90%;">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th scope="col">DNI</th>
								<th scope="col">Dirección</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody id="idDetalleTablaCliente">
						</tbody>
					</table>
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>


			</div>
		</div>
	</section>
	
	<script type="module" src="js/cliente.js"></script>
	<%@include file="component/allscript.jsp" %>
</body>
</html>