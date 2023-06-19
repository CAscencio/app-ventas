import {mostrarSpinner, ocultarSpinner} from './spinner.js';

const inputBuscarClienteVenta = document.getElementById('idBuscarClienteVenta');
const selectClientes = document.getElementById('idSelectClientes');

let dniClienteVenta = document.getElementById('idDniClienteVenta');
let direccionClienteVenta = document.getElementById('idDireccionClienteVenta');

let timeoutId;
let isDisplayDropdown = true;

inputBuscarClienteVenta.addEventListener('input', () => {
	clearTimeout(timeoutId);
	if (inputBuscarClienteVenta.value === '') {
		limpiarDatosCliente();
	}
});

inputBuscarClienteVenta.addEventListener('keyup', (event) => {
	const filtro = event.target.value;

	clearTimeout(timeoutId);
	mostrarSpinner();

	timeoutId = setTimeout(function() {
		console.log('Han pasado 0.5 segundos');
		buscarTop5Clientes(filtro);
	}, 500);
});

inputBuscarClienteVenta.addEventListener('search', limpiarDatosCliente);

inputBuscarClienteVenta.addEventListener('blur', () => {
	console.log('onBlur: ', inputBuscarClienteVenta.value);
	validarDatosCliente();
});

document.addEventListener('click', (event) => {
	console.log('OnClick');
	const target = event.target;
	const isInsideSelect = inputBuscarClienteVenta.contains(target) || selectClientes.contains(target);

	if (!isInsideSelect && isDisplayDropdown) {
		selectClientes.style.display = 'none';
		validarDatosCliente();
	}
});


function buscarTop5Clientes(filtro) {
	
	let clientes = [];
	let url = `ClienteBuscarTop5?filtro=${filtro}`;

	let xhr = new XMLHttpRequest();
	xhr.open("GET", url, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			clientes = JSON.parse(xhr.responseText);
			console.log(clientes);

			// Limpiar opciones anteriores
			selectClientes.innerHTML = '';

			// Mostrar las opciones coincidentes
			clientes.forEach(function(cliente) {
				//    if (option.toLowerCase().includes(searchTerm)) {
				const optionItem = document.createElement('button');
				optionItem.className = 'dropdown-item';
				optionItem.type = 'button';
				optionItem.textContent = `${cliente.nombre} ${cliente.apellido}`;
				optionItem.addEventListener('click', function() {
					inputBuscarClienteVenta.value = `${cliente.nombre} ${cliente.apellido}`;
					cargarDatosCliente(cliente);
					validarDatosCliente();
					selectClientes.style.display = 'none';
					isDisplayDropdown = false;
				});
				selectClientes.appendChild(optionItem);
				//    }
			});

			// Mostrar u ocultar el menú de opciones según si hay coincidencias o no
			if (selectClientes.children.length > 0) {
				selectClientes.style.display = 'block';
				isDisplayDropdown = true;
			} else {
				selectClientes.style.display = 'none';
				isDisplayDropdown = false;
			}
		}
		ocultarSpinner();
	};

	xhr.send();
}

function cargarDatosCliente(cliente) {
	dniClienteVenta.value = cliente.dni;
	direccionClienteVenta.value = cliente.direccion;
}

function limpiarDatosCliente() {
	dniClienteVenta.value = '';
	direccionClienteVenta.value = '';
}

function validarDatosCliente() {
	console.log('validando...');
	if (inputBuscarClienteVenta.value != '' && dniClienteVenta.value != '') {
		inputBuscarClienteVenta.classList.remove('is-invalid');
		inputBuscarClienteVenta.classList.add('is-valid');
	} else {
		inputBuscarClienteVenta.classList.remove('is-valid');
		inputBuscarClienteVenta.classList.add('is-invalid');
	}
}