package com.cascencio.dev.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cascencio.dev.model.Producto;
import com.cascencio.dev.service.ProductoServiceImpl;
import com.google.gson.Gson;

@WebServlet({"/ProductoBuscar"})
public class ProductoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private final ProductoServiceImpl productoService = new ProductoServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletPath();
		switch (path) {
		case "/ProductoBuscar":
			search(request, response);
			break;
		}

	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) {
		String filtro = Optional.ofNullable(request.getParameter("filtro")).orElse("");
		
		List<Producto> productos = productoService.buscarPorFiltro(filtro);
		
		Gson gson = new Gson();
		String data = gson.toJson(productos);
		ControllerUtil.responseJson(response, data);
	}

}
