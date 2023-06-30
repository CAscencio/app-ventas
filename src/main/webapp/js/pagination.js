const itemsPerPage = 20;
//let totalItems = 0;
let totalPages;
const maxVisiblePages = 5;
let currentPage = 1;
let currentPageProducto = 1;

async function generatePagination(pagina, cantidad, fnListar) {
	currentPage = pagina;
	let totalItems = await fnListar(pagina, cantidad);
//	console.log(`First method...(pagina: ${pagina} & cantidad: ${cantidad})`);
	
	totalPages = Math.ceil(totalItems / itemsPerPage);
	
	const paginationContainer = document.getElementById('paginationContainer');
	paginationContainer.innerHTML = '';

//	if (totalPages <= 1) {
//		return; // No se necesita paginación si solo hay una página
//	}

	const pagination = document.createElement('ul');
	pagination.classList.add('pagination');

	// Botón "Anterior"
	const previousButton = createPaginationButton('Anterior', currentPage > 1, () => {
		currentPage--;
		generatePagination(pagina, cantidad, fnListar);
		console.log(`Página actual: ${currentPage}`);
	});
	pagination.appendChild(previousButton);

	// Páginas intermedias
	const visiblePages = calculateVisiblePages();
	for (let i = visiblePages.start; i <= visiblePages.end; i++) {
		const pageButton = createPaginationButton(i, currentPage !== i, () => {
			currentPage = i;
			generatePagination(pagina, cantidad, fnListar);
			console.log(`Página actual: ${currentPage}`);
		});
		pagination.appendChild(pageButton);
	}

	// Botón "Siguiente"
	const nextButton = createPaginationButton('Siguiente', currentPage < totalPages, () => {
		currentPage++;
		generatePagination(pagina, cantidad, fnListar);
		console.log(`Página actual: ${currentPage}`);
	});
	pagination.appendChild(nextButton);

	paginationContainer.appendChild(pagination);
	
	return currentPage;
}

function createPaginationButton(label, enabled, onClick) {
	const button = document.createElement('li');
	button.classList.add('page-item');
	if (!enabled) {
		button.classList.add('disabled');
	}
	if (currentPage === label) {
		button.classList.add('active');
	}

	const link = document.createElement('a');
	link.classList.add('page-link');
	link.href = '#';
	link.textContent = label;
	link.addEventListener('click', (event) => {
		event.preventDefault();
		if (enabled) {
			onClick();
		}
	});

	button.appendChild(link);
	return button;
}

function calculateVisiblePages() {
	let start = currentPage - Math.floor(maxVisiblePages / 2);
	let end = currentPage + Math.floor(maxVisiblePages / 2);

	if (start < 1) {
		start = 1;
		end = Math.min(maxVisiblePages, totalPages);
	}

	if (end > totalPages) {
		end = totalPages;
		start = Math.max(1, totalPages - maxVisiblePages + 1);
	}

	return { start, end };
}

currentPageProducto = generatePagination(currentPageProducto, 20, listarAll);

//function listarAll(pagina, cantidad) {
//	console.log(`Listando...(pagina: ${pagina} & cantidad: ${cantidad})`);
//	return 85;
//}

function listarAll(pagina, cantidad) {
	return new Promise(resolve => {
		// Simulación de una demora de 3 segundos
		setTimeout(function() {
			console.log(`Listando...(pagina: ${pagina} & cantidad: ${cantidad})`);
			resolve(85);
		}, 3000);
	});
}