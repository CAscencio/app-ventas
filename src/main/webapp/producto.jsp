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
<!-- 							<button type="button" class="btn btn-primary" id="idNuevoProducto" data-bs-toggle="modal" data-bs-target="#exampleModal">Nuevo</button> -->
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

				<div id="paginationContainer" class="d-flex justify-content-center mt-4"></div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="idModalProducto" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Crear Producto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="container-fluid">
						<div class="row g-3">
      						<div class="col-md-12">
							    <label for="idCodigoSKU" class="form-label">Código SKU<span class="text-danger">*</span></label>
							    <input type="text" class="form-control form-control-sm" id="idSkuProducto" required>
							    <div class="valid-feedback">
							      Looks good!
							    </div>
							</div>
							<div class="col-md-4">
							    <label for="idNombreProducto" class="form-label">Nombre<span class="text-danger">*</span></label>
							    <input type="text" class="form-control form-control-sm" id="idNombreProducto" required oninput="validateInput(this)" onblur="campoRequerido(this)">
							    <div id="idNombreProductoFeedback"></div>
							</div>
							<div class="col-md-8">
							    <label for="idDescripcionProducto" class="form-label">Descripción</label>
							    <input type="text" class="form-control form-control-sm" id="idDescripcionProducto" required>
							    <div class="invalid-feedback">
							      Campo requerido
							    </div>
							</div>
							<div class="col-md-12">
							    <label for="validationCustom01" class="form-label">Categoria<span class="text-danger">*</span></label>
							    <select id="idSelectCategoria" class="form-select form-select-sm" required>
							    <option disabled selected value="">Selecciona una opción</option>
<!-- 								  <option selected>Seleccione</option> -->
<!-- 								  <option value="1">One</option> -->
<!-- 								  <option value="2">Two</option> -->
<!-- 								  <option value="3">Three</option> -->
								</select>
							</div>
							<div class="col-md-6">
							    <label for="idPrecioUnitProducto" class="form-label">Precio Unit.<span class="text-danger">*</span></label>
							    <input type="text" class="form-control form-control-sm" id="idPrecioUnitProducto" required>
							    <div class="valid-feedback">
							      Looks good!
							    </div>
							</div>
							<div class="col-md-6">
							    <label for="idStockProducto" class="form-label">Stock<span class="text-danger">*</span></label>
							    <input type="number" class="form-control form-control-sm" id="idStockProducto" required>
							    <div class="valid-feedback">
							      Looks good!
							    </div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-primary" id="idGuardarProducto">Guardar</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="module" src="js/producto.js"></script>
	<%@include file="component/allscript.jsp" %>
</body>
</html>