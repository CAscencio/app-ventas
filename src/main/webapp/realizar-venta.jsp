<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="component/allhead.jsp" %>
</head>
<body>
	<jsp:include page="component/sidebar.jsp"></jsp:include>

	<section class="home-section">
		<div class="home-content">
			<i class='bx bx-menu'></i>
			<div style="display: inline-block;">
				<span class="text">Realizar venta</span>
				<jsp:include page="component/spinner.jsp"></jsp:include>
			</div>		

			<div class="container overflow-auto overflow-auto" style="height: 100vh;">
				
				<div class="my-3 p-3 bg-body rounded shadow-sm">
					<h6 class="border-bottom pb-2 mb-0">Datos del Cliente</h6>
					<form class="row g-3 pt-3 needs-validation" novalidate>
					  <div class="col-md-6 position-relative">
					    <label for="idBuscarClienteVenta" class="form-label">Cliente</label>
					    <input type="search" class="form-control" id="idBuscarClienteVenta" required>
					    <div id="idSelectClientes" class="dropdown-menu" aria-labelledby="selectInput" style="width: 97% !important;"></div>
					    <div class="invalid-feedback">Por favor ingrese el cliente</div>
					  </div>
					  <div class="col-md-2">
					    <label for="idDniClienteVenta" class="form-label">DNI</label>
					    <input type="text" class="form-control" id="idDniClienteVenta" readonly="readonly">
					  </div>
					  <div class="col-md-4">
					    <label for="idDireccionClienteVenta" class="form-label">Dirección</label>
					      <input type="text" class="form-control" id="idDireccionClienteVenta" readonly="readonly">
					  </div>
					</form>
					
					<div class="d-flex justify-content-end mt-3">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<i class="bx bxs-cart-add me-1"></i>Agregar producto
						</button>
					</div>
				</div>
				
				<div class="mt-3 mb-5 p-3 bg-body rounded shadow-sm overflow-auto">
					<h6 class="border-bottom pb-2 mb-0">Detalle de los productos</h6>
					<table class="table table-sm table-hover" style="with: 90%;">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">SKU</th>
								<th scope="col">Nombre</th>
								<th scope="col">Cantidad</th>
								<th scope="col">Precio Unit.</th>
								<th scope="col">Precio Total</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody id="idDetalleTablaRealizarVenta">
							<tr>
								<th>1</th>
								<td>333-333-555-444</td>
								<td>Galleta Oreo</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>2</th>
								<td>433-333-555-444</td>
								<td>Gaseosa Inka Cola</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>3</th>
								<td>533-333-555-444</td>
								<td>Agua Cielo</td>
								<td>3</td>
								<td>1.00</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>4</th>
								<td>633-333-555-444</td>
								<td>Paq. Galletas</td>
								<td>1</td>
								<td>4.50</td>
								<td>4.50</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>1</th>
								<td>333-333-555-444</td>
								<td>Galleta Oreo</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>2</th>
								<td>433-333-555-444</td>
								<td>Gaseosa Inka Cola</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>3</th>
								<td>533-333-555-444</td>
								<td>Agua Cielo</td>
								<td>3</td>
								<td>1.00</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>4</th>
								<td>633-333-555-444</td>
								<td>Paq. Galletas</td>
								<td>1</td>
								<td>4.50</td>
								<td>4.50</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>1</th>
								<td>333-333-555-444</td>
								<td>Galleta Oreo</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>2</th>
								<td>433-333-555-444</td>
								<td>Gaseosa Inka Cola</td>
								<td>2</td>
								<td>1.50</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>3</th>
								<td>533-333-555-444</td>
								<td>Agua Cielo</td>
								<td>3</td>
								<td>1.00</td>
								<td>3.00</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th>4</th>
								<td>633-333-555-444</td>
								<td>Paq. Galletas</td>
								<td>1</td>
								<td>4.50</td>
								<td>4.50</td>
								<td><button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
								<td></td>
								<td></td>
								<td class="fw-bold">TOTAL S/.</td>
								<td class="fw-bold">13.50</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</section>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content p-2">
<!-- 	      <div class="modal-header"> -->
<!-- 	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
<!-- 	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!-- 	      </div> -->
	      <div class="modal-body">
	      	<div class="input-group mb-1">
				<span class="input-group-text bg-border-white"><i class="bx bx-search-alt-2"></i></span>
			  	<input type="search" class="form-control" placeholder="Buscar producto..." id="idBuscarProducto">
			</div>
	      	<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">SKU</th>
						<th scope="col">Nombre</th>
						<th scope="col">Descripción</th>
						<th scope="col">Precio</th>
						<th scope="col">Stock</th>
						<th scope="col">Acciones</th>
					</tr>
				</thead>
				<tbody id="idDetalleTablaProducto">
				</tbody>
			</table>
	      </div>
<!-- 	      <div class="modal-footer"> -->
<!-- 	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!-- 	        <button type="button" class="btn btn-primary">Save changes</button> -->
<!-- 	      </div> -->
	    </div>
	  </div>
	</div>
	
	<script type="module" src="js/realizar-venta.js"></script>
	<%@include file="component/allscript.jsp" %>
</body>
</html>