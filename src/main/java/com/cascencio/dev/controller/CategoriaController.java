package com.cascencio.dev.controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cascencio.dev.model.Categoria;
import com.cascencio.dev.service.CategoriaServiceImpl;
import com.google.gson.Gson;

@WebServlet({ "/CategoriaObtenerTodos" })
public class CategoriaController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final CategoriaServiceImpl categoriaService = new CategoriaServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletPath();
		switch (path) {
		case "/CategoriaObtenerTodos":
			obtenerTodos(request, response);
			break;
		}

	}

	private void obtenerTodos(HttpServletRequest request, HttpServletResponse response) {
		List<Categoria> categorias = categoriaService.obtenerTodos();

		Gson gson = new Gson();
		String data = gson.toJson(categorias);
		ControllerUtil.responseJson(response, data);
	}
}
