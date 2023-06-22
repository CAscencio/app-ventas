<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="component/allhead.jsp" %>
<link rel="stylesheet" href="css/toast.css">
</head>
<body>
	<jsp:include page="component/sidebar.jsp"></jsp:include>

	<section class="home-section">
		<jsp:include page="component/toast.jsp"></jsp:include>
		<div class="home-content">
			<i class='bx bx-menu'></i>
			<div style="display: inline-block;">
				<span class="text">Productos</span>
				<jsp:include page="component/spinner.jsp"></jsp:include>
			</div>	

			<div class="container overflow-auto" style="height: 100vh;">

		
				<div class="p-3 my-3 rounded shadow-sm">
					<div class="row g-3 pt-3">
						<div class="col-md-11">
							<div class="input-group pe-5">
		  						<span class="input-group-text bg-border-white"><i class="bx bx-search-alt-2"></i></span>
							  	<input type="search" class="form-control" placeholder="Buscar..." id="idBuscarProducto">
							</div>
						</div>
						<div class="col-md-1">
							<button type="button" class="btn btn-primary" id="idNuevoProducto">Nuevo</button>
						</div>
					</div>
				</div>

				<div class="p-3 my-3 rounded shadow-sm bg-body overflow-auto">
					<table class="table table-hover" style="with: 90%;">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">SKU</th>
								<th scope="col">Nombre</th>
								<th scope="col">Descripción</th>
								<th scope="col">Categoria</th>
								<th scope="col">Precio</th>
								<th scope="col">Stock</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody id="idDetalleTablaProducto">
						</tbody>
					</table>
				</div>


			</div>
		</div>
	</section>
	
	<script type="module" src="js/producto.js"></script>
	<%@include file="component/allscript.jsp" %>
</body>
</html>