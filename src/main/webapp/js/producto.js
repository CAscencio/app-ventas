import {mostrarSpinner, ocultarSpinner} from './spinner.js';
import {createToast} from './toast.js';

const inputBuscarProducto = document.getElementById('idBuscarProducto');
const btnNuevoProducto = document.getElementById('idNuevoProducto');
const btnGuardarProducto = document.getElementById('idGuardarProducto');
const modalProducto = document.getElementById('idModalProducto');
const modalProductoRef = new bootstrap.Modal(modalProducto);

let timeoutId;
window.onload = listarProductos;


inputBuscarProducto.addEventListener('input', function() {
  clearTimeout(timeoutId);
});

inputBuscarProducto.addEventListener('keyup', () => {
	clearTimeout(timeoutId);
	mostrarSpinner();

	timeoutId = setTimeout(function() {
		console.log('Han pasado 0.5 segundos');
		listarProductos();
	}, 500);
});

inputBuscarProducto.addEventListener('search', listarProductos);

function listarProductos() {
	console.log('Pagina producto cargada');

	let productos = [];

	let filtro = document.getElementById('idBuscarProducto').value;
	let url = `ProductoBuscar?filtro=${filtro}`;

	let xhr = new XMLHttpRequest();
	xhr.open("GET", url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			productos = JSON.parse(xhr.responseText);

			let detalleTablaProducto = '';

			productos.forEach(item => {
				detalleTablaProducto += `
				<tr>
					<th scope="row">${item.id}</th>
					<td>${item.sku}</td>
					<td>${item.nombre}</td>
					<td>${item.descripcion}</td>
					<td>${item.categoria.nombre}</td>
					<td>${item.precioVenta}</td>
					<td>${item.stock}</td>
					<td>
						<button type="button" class="btn btn-light"><i class="bx bxs-pencil"></i></button>
						<button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button>
					</td>
				</tr>`;
			});

			document.getElementById("idDetalleTablaProducto").innerHTML = detalleTablaProducto;
			console.log(productos);
		}
		
		ocultarSpinner();
	};
	xhr.send();
}

btnNuevoProducto.addEventListener('click', () => {
	//Test de mostrar toast
	createToast();

	// Abrir modal formulario
//	let modalProducto = document.getElementById('idModalProducto');
//	let modalProductoRef = new bootstrap.Modal(modalProducto);
	modalProductoRef.show();

	// Cargar categorias en elemento <select>
	let selectCategoria = document.getElementById('idSelectCategoria');

	obtenerCategorias(categorias => {
		categorias.forEach(categoria => {
			let option = document.createElement('option');
			option.value = categoria.id;
			option.text = categoria.nombre;

			// Agrega la opción al <select>
			selectCategoria.appendChild(option);
		});
	});
});

function obtenerCategorias(callback) {
	let url = 'CategoriaObtenerTodos';
	let xhr = new XMLHttpRequest();

	xhr.open("GET", url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			// Llamar al callback con los datos obtenidos
			callback(JSON.parse(xhr.responseText));
		} else {
			// Llamar al callback con un arreglo vacío en caso de error
			callback([]);
		}
	};
	xhr.send();
}

btnGuardarProducto.addEventListener('click', guardarProducto);

function guardarProducto() {
	let datos = "sku=" + document.getElementById('idSkuProducto').value;
	datos += "&nombre=" + document.getElementById('idNombreProducto').value;
	datos += "&descripcion=" + document.getElementById('idDescripcionProducto').value;
	datos += "&categoriaId=" + document.getElementById('idSelectCategoria').value;
	datos += "&precioVenta=" + document.getElementById('idPrecioUnitProducto').value;
	datos += "&stock=" + document.getElementById('idStockProducto').value;
	
	console.log('DATOS: ', datos);
	
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "ProductoCrear", true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			// La solicitud se completó correctamente
			modalProductoRef.hide();
			createToast();
			console.log(xhr.responseText);
		}
	};
	xhr.send(datos);
}
