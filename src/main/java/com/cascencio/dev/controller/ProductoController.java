package com.cascencio.dev.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cascencio.dev.model.Categoria;
import com.cascencio.dev.model.Producto;
import com.cascencio.dev.service.ProductoServiceImpl;
import com.google.gson.Gson;

@WebServlet({"/ProductoBuscar", "/ProductoCrear"})
public class ProductoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final ProductoServiceImpl productoService = new ProductoServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletPath();
		switch (path) {
		case "/ProductoBuscar":
			buscarPorFiltro(request, response);
			break;
		case "/ProductoCrear":
			crear(request, response);
			break;
		}

	}
	
	private void buscarPorFiltro(HttpServletRequest request, HttpServletResponse response) {
		String filtro = Optional.ofNullable(request.getParameter("filtro")).orElse("");
		
		List<Producto> productos = productoService.buscarPorFiltro(filtro);
		
		Gson gson = new Gson();
		String data = gson.toJson(productos);
		ControllerUtil.responseJson(response, data);
	}
	
	private void crear(HttpServletRequest request, HttpServletResponse response) {		
		Categoria categoria = new Categoria();
		categoria.setId(Integer.parseInt(request.getParameter("categoriaId")));
		
		Producto producto = new Producto();
		producto.setSku(request.getParameter("sku"));
		producto.setNombre(request.getParameter("nombre"));
		producto.setDescripcion(request.getParameter("descripcion"));
		producto.setCategoria(categoria);
		producto.setPrecioVenta(new BigDecimal(request.getParameter("precioVenta")));
		producto.setStock(Integer.parseInt(request.getParameter("stock")));
		
		productoService.crear(producto);
		
		ControllerUtil.responseJson(response, "Producto creado con exito");
	}

}
