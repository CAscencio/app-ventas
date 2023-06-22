import {mostrarSpinner, ocultarSpinner} from './spinner.js';

const inputBuscarCliente = document.getElementById('idBuscarCliente');

let timeoutId;

window.onload = listarClientes;

inputBuscarCliente.addEventListener('input', function() {
  clearTimeout(timeoutId);
});

inputBuscarCliente.addEventListener('keyup', () => {
	clearTimeout(timeoutId);
	mostrarSpinner();

	timeoutId = setTimeout(function() {
		console.log('Han pasado 0.5 segundos');
		listarClientes();
	}, 500);
});

function listarClientes() {
	console.log('Pagina cliente cargada');

	let clientes = [];

	let filtro = document.getElementById('idBuscarCliente').value;
	let url = `ClienteBuscar?filtro=${filtro}`;

	let xhr = new XMLHttpRequest();
	xhr.open("GET", url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			clientes = JSON.parse(xhr.responseText);

			let detalleTablaCliente = '';

			clientes.forEach(item => {
				detalleTablaCliente += `
				<tr>
					<th scope="row">${item.id}</th>
					<td>${item.nombre}</td>
					<td>${item.apellido}</td>
					<td>${item.dni}</td>
					<td>${item.direccion}</td>
					<td>
						<button type="button" class="btn btn-light"><i class="bx bxs-pencil"></i></button>
						<button type="button" class="btn btn-danger"><i class="bx bxs-trash"></i></button>
					</td>
				</tr>`;
			});

			document.getElementById("idDetalleTablaCliente").innerHTML = detalleTablaCliente;
			console.log(clientes);
		}
		
		ocultarSpinner();
	};
	xhr.send();
}