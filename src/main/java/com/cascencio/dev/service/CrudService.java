package com.cascencio.dev.service;

import java.util.List;

public interface CrudService<T, ID> {

	List<T> obtenerTodos();
	
	List<T> buscarPorFiltro(String filtro);
	
	void crear(T t);
	
	void actualizar(T t);
	
	void eliminar(ID id);
	
}
