package com.cascencio.dev.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cascencio.dev.model.Cliente;
import com.cascencio.dev.service.ClienteServiceImpl;
import com.google.gson.Gson;

@WebServlet({ "/ClienteBuscar", "/ClienteBuscarTop5" })
public class ClienteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private final ClienteServiceImpl clienteService = new ClienteServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletPath();
		switch (path) {
		case "/ClienteBuscar":
			search(request, response);
			break;
		case "/ClienteBuscarTop5":
			searchTop5(request, response);
			break;
		}

	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) {
		String filtro = Optional.ofNullable(request.getParameter("filtro")).orElse("");
		
		List<Cliente> clientes = clienteService.search(filtro);
		
		Gson gson = new Gson();
		String data = gson.toJson(clientes);
		ControllerUtil.responseJson(response, data);
	}
	
	private void searchTop5(HttpServletRequest request, HttpServletResponse response) {
		String filtro = Optional.ofNullable(request.getParameter("filtro")).orElse("");
		
		List<Cliente> clientes = clienteService.searchTop5(filtro);
		
		Gson gson = new Gson();
		String data = gson.toJson(clientes);
		ControllerUtil.responseJson(response, data);
	}

}
