package com.cascencio.dev.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cascencio.dev.config.DatabaseConnection;
import com.cascencio.dev.exception.ServerException;
import com.cascencio.dev.model.Categoria;

public class CategoriaServiceImpl implements CrudService<Categoria, Integer>{

	@Override
	public List<Categoria> obtenerTodos() {
		Connection cxn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT id, nombre FROM public.categorias WHERE estado = 'A'";

		Categoria categoria;
		List<Categoria> categorias = new ArrayList<>();
		
		try {
			cxn = DatabaseConnection.obtenerConexion();
			ps = cxn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				categoria = new Categoria();
				categoria.setId(rs.getInt("id"));
				categoria.setNombre(rs.getString("nombre"));
				
				categorias.add(categoria);
			}
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Error al obtener categorias: " + e.getMessage());
			throw new ServerException("Error al obtener categorias");
		} finally {
			try {
				cxn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return categorias;
	}

	@Override
	public List<Categoria> buscarPorFiltro(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void crear(Categoria t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actualizar(Categoria t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void eliminar(Integer id) {
		// TODO Auto-generated method stub
		
	}

}
