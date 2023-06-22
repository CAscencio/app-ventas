package com.cascencio.dev.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cascencio.dev.config.DatabaseConnection;
import com.cascencio.dev.model.Categoria;
import com.cascencio.dev.model.Producto;

public class ProductoServiceImpl implements CrudService<Producto, Integer>{

	@Override
	public List<Producto> obtenerTodos() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Producto> buscarPorFiltro(String filtro) {
		Connection cxn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "SELECT"
				+ "    p.id,"
				+ "    p.sku,"
				+ "    p.nombre,"
				+ "    p.descripcion,"
				+ "    c.id as categoria_id,"
				+ "    c.nombre as categoria_nombre,"
				+ "    p.precio_venta,"
				+ "    p.stock "
				+ "FROM public.productos p "
				+ "INNER JOIN public.categorias c on c.id = p.categoria_id "
				+ "WHERE p.sku ILIKE ? OR p.nombre ILIKE ? OR p.descripcion ILIKE ?";
		
		Producto producto;
		Categoria categoria;
		List<Producto> productos = new ArrayList<>();
		
		try {
			cxn = DatabaseConnection.obtenerConexion();
			ps = cxn.prepareStatement(sql);
			ps.setString(1, "%" + filtro + "%");
			ps.setString(2, "%" + filtro + "%");
			ps.setString(3, "%" + filtro + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				categoria = new Categoria();
				categoria.setId(rs.getInt("categoria_id"));
				categoria.setNombre(rs.getString("categoria_nombre"));
				
				producto = new Producto();
				producto.setId(rs.getInt("id"));
				producto.setSku(rs.getString("sku"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setCategoria(categoria);
				producto.setPrecioVenta(rs.getBigDecimal("precio_venta"));
				producto.setStock(rs.getInt("stock"));
				
				productos.add(producto);
			}
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Error al buscar productos: " + e.getMessage());
		} finally {
			try {
				cxn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return productos;
	}

}