package com.cascencio.dev.model;

import java.math.BigDecimal;

public class Producto {
	
	private Integer id; 
	private Categoria categoria;
	private String sku;
	private String nombre;
	private String descripcion;
	private BigDecimal precioVenta;
	private Integer stock;
	private String estado = "A";
	
	public Producto() {
	}

	public Producto(Categoria categoria, String sku, String nombre, String descripcion, BigDecimal precioVenta, Integer stock) {
		this.categoria = categoria;
		this.sku = sku;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioVenta = precioVenta;
		this.stock = stock;
	}

	public Producto(Integer id, Categoria categoria, String sku, String nombre, String descripcion,
			BigDecimal precioVenta, Integer stock, String estado) {
		this.id = id;
		this.categoria = categoria;
		this.sku = sku;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precioVenta = precioVenta;
		this.stock = stock;
		this.estado = estado;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public BigDecimal getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(BigDecimal precioVenta) {
		this.precioVenta = precioVenta;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
