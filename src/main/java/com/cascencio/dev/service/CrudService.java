package com.cascencio.dev.service;

import java.util.List;

public interface CrudService<T, ID> {

	List<T> findAll();
	
	List<T> search(String filtro);
	
}
