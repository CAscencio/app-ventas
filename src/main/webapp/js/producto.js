import {mostrarSpinner, ocultarSpinner} from './spinner.js';
import {createToast} from './toast.js';

//Test de mostrar toast
const button = document.getElementById("idNuevoProducto");
button.addEventListener("click", () => createToast());

const inputBuscarProducto = document.getElementById('idBuscarProducto');

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