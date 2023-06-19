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
				<span class="text">Categorias</span>
				<jsp:include page="component/spinner.jsp"></jsp:include>
			</div>	

			<div class="container">


				<div class="d-flex align-items-center p-3 my-3 rounded shadow-sm">
					<div class="input-group pe-5">
  						<span class="input-group-text bg-border-white"><i class="bx bx-search-alt-2"></i></span>
					  	<input type="search" class="form-control" placeholder="Buscar..." id="idBuscarCategoria">
					</div>
					
					<button type="button" class="btn btn-primary">Nuevo</button>
				</div>

				<div class="d-flex align-items-center p-3 my-3 rounded shadow-sm">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Descripción</th>
								<th scope="col">Estado</th>
								<th scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody id="idDetalleTablaCategoria">
						</tbody>
					</table>
				</div>


			</div>
		</div>
	</section>
	
	<%@include file="component/allscript.jsp" %>
</body>
</html>