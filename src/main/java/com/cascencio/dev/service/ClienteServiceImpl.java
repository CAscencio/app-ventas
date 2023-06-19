package com.cascencio.dev.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.cascencio.dev.config.DatabaseConnection;
import com.cascencio.dev.model.Cliente;

public class ClienteServiceImpl implements CrudService<Cliente, Integer>{

	@Override
	public List<Cliente> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cliente> search(String filtro) {
		Connection cxn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM public.clientes WHERE nombre ILIKE ? OR apellido ILIKE ? OR dni ILIKE ?";
		Cliente cliente;
		List<Cliente> clientes = new ArrayList<>();
		
		try {
			cxn = DatabaseConnection.obtenerConexion();
			ps = cxn.prepareStatement(sql);
			ps.setString(1, "%" + filtro + "%");
			ps.setString(2, "%" + filtro + "%");
			ps.setString(3, "%" + filtro + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setEstado(rs.getString("estado"));
				
				clientes.add(cliente);
			}
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Error al buscar personas: " + e.getMessage());
		} finally {
			try {
				cxn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return clientes;
	}
	
	public List<Cliente> searchTop5(String filtro) {
		Connection cxn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM public.clientes "
				+ "WHERE nombre ILIKE ? OR apellido ILIKE ? OR dni ILIKE ? OR direccion ILIKE ? "
				+ "LIMIT 5";
		Cliente cliente;
		List<Cliente> clientes = new ArrayList<>();
		
		try {
			cxn = DatabaseConnection.obtenerConexion();
			ps = cxn.prepareStatement(sql);
			ps.setString(1, "%" + filtro + "%");
			ps.setString(2, "%" + filtro + "%");
			ps.setString(3, "%" + filtro + "%");
			ps.setString(4, "%" + filtro + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNombre(rs.getString("nombre"));
				cliente.setApellido(rs.getString("apellido"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setEstado(rs.getString("estado"));
				
				clientes.add(cliente);
			}
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Error al buscar personas: " + e.getMessage());
		} finally {
			try {
				cxn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return clientes;
	}

}
