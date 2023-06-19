-- Crear una base de datos: db_ventas

-- secuencias
CREATE SEQUENCE seq_categoria_id;

CREATE SEQUENCE seq_producto_id;

CREATE SEQUENCE seq_cliente_id;

CREATE SEQUENCE seq_venta_id;

CREATE SEQUENCE seq_venta_detalle_id;

-- tablas
CREATE TABLE categorias (
    id int default nextval('seq_categoria_id'::regclass) NOT NULL,
    nombre varchar(100) NOT NULL,
    descripcion varchar(100),
    estado char(1) default 'A' NOT NULL,
    CONSTRAINT categorias_pk PRIMARY KEY (id)
);

CREATE TABLE productos (
    id int default nextval('seq_producto_id'::regclass) NOT NULL,
    categoria_id int  NOT NULL,
    sku varchar(16)  NOT NULL,
    nombre varchar(150)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    precio_venta decimal(5,4)  NOT NULL,
    stock int  NOT NULL,
    estado char(1) default 'A' NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (id)
);

CREATE TABLE clientes (
    id int default nextval('seq_cliente_id'::regclass) NOT NULL,
    nombre varchar(150)  NOT NULL,
    apellido varchar(150)  NOT NULL,
    dni char(8)  NOT NULL,
    direccion varchar(250),
    estado char(1) default 'A' NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id)
);

-- Table: ventas
CREATE TABLE ventas (
    id int default nextval('seq_venta_id'::regclass) NOT NULL,
    cliente_id int  NOT NULL,
    fecha int  NOT NULL,
    total decimal(5,2)  NOT NULL,
    CONSTRAINT ventas_pk PRIMARY KEY (id)
);

-- Table: ventas_detalle
CREATE TABLE ventas_detalle (
    id int default nextval('seq_venta_detalle_id'::regclass) NOT NULL,
    venta_id int  NOT NULL,
    producto_id int  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT ventas_detalle_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: productos_categorias (table: productos)
ALTER TABLE productos ADD CONSTRAINT productos_categorias
    FOREIGN KEY (categoria_id)
    REFERENCES categorias (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ventas_clientes (table: ventas)
ALTER TABLE ventas ADD CONSTRAINT ventas_clientes
    FOREIGN KEY (cliente_id)
    REFERENCES clientes (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ventas_detalle_ventas (table: ventas_detalle)
ALTER TABLE ventas_detalle ADD CONSTRAINT ventas_detalle_ventas
    FOREIGN KEY (venta_id)
    REFERENCES ventas (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: ventas_detalle_productos (table: ventas_detalle)
ALTER TABLE ventas_detalle ADD CONSTRAINT ventas_detalle_productos
    FOREIGN KEY (producto_id)
    REFERENCES productos (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

