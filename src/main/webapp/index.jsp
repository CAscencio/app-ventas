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
 			<i class='bx bx-menu'></i> <span class="text">Dashboard</span>
 			
 			<div class="container m-1">
 				<p>Hola Body</p>
 				
<!--  				<div id="pagination-container"> -->
<!-- 				  <nav aria-label="Page navigation"> -->
<!-- 				    <ul class="pagination"></ul> -->
<!-- 				  </nav> -->
<!-- 				</div> -->

 				<div id="paginationContainer" class="d-flex justify-content-center mt-4"></div>
 				
 				<div class="row d-flex justify-content-center">
 					<div class="col-md-2">
 						<button class="btn btn-secondary" id="idSuccess">Success</button>
 					</div>
 					<div class="col-md-2">
 						<button class="btn btn-secondary" id="idInfo">Info</button>
 					</div>
 					<div class="col-md-2">
 						<button class="btn btn-secondary" id="idWarning">Warning</button>
 					</div>
 					<div class="col-md-2">
 						<button class="btn btn-secondary" id="idError">Error</button>
 					</div>
 				</div>
 			</div>
 		</div>
 	</section>
 	
 	<script type="module">
 		import {createToast} from './js/toast.js';
 	
 		const idSuccess = document.getElementById('idSuccess');
 		idSuccess.addEventListener('click', () => {
			console.log('Click...');
			createToast('Mensaje para acciones completadas correctamente', 'success');
		});

		const idInfo = document.getElementById('idInfo');
 		idInfo.addEventListener('click', () => {
			console.log('Click...');
			createToast('Mensajes para informar', 'info');
		});

		const idWarning = document.getElementById('idWarning');
 		idWarning.addEventListener('click', () => {
			console.log('Click...');
			createToast('Mensaje de precaución', 'warning');
		});

		const idError = document.getElementById('idError');
 		idError.addEventListener('click', () => {
			console.log('Click...');
			createToast('Mensaje para errores', 'error');
		});
 	</script>
	
	<script type="text/javascript" src="js/pagination.js"></script>
	
	<%@include file="component/allscript.jsp" %>
</body>
</html>