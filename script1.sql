-- se ejecuta en PostgreSQL 
-- se crea la base de datos 
CREATE DATABASE "Cantera_Aplicativo_Ventas_Taller_SQL"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- se crea las tablas 

CREATE TABLE public.producto
(
    id_producto serial NOT NULL,
    nombre character varying(100) NOT NULL,
    precio integer NOT NULL,
    PRIMARY KEY (id_producto)
);

ALTER TABLE public.producto
    OWNER to postgres;

CREATE TABLE public.proveedor
(
    id_proveedor serial NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    PRIMARY KEY (id_proveedor)
);

ALTER TABLE public.proveedor
    OWNER to postgres;

CREATE TABLE public.registro_proveedor_producto
(
    id_producto integer NOT NULL,
    id_proveedor integer NOT NULL,
    CONSTRAINT id_producto FOREIGN KEY (id_producto)
        REFERENCES public.producto (id_producto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT id_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES public.proveedor (id_proveedor) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE public.registro_proveedor_producto
    OWNER to postgres;


CREATE TABLE public.documento
(
    id_documento serial NOT NULL,
    tipo_documento character varying(4) NOT NULL,
    numero_documento integer NOT NULL,
    PRIMARY KEY (id_documento)
);

ALTER TABLE public.documento
    OWNER to postgres;

CREATE TABLE public.cliente
(
    id_cliente serial NOT NULL,
    nombre character varying(100) NOT NULL,
    id_documento integer NOT NULL,
    PRIMARY KEY (id_cliente),
    CONSTRAINT id_documento FOREIGN KEY (id_documento)
        REFERENCES public.documento (id_documento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE public.cliente
    OWNER to postgres;

CREATE TABLE public.factura
(
    id_factura serial NOT NULL,
    id_cliente integer NOT NULL,
    porcentaje_descuento integer NOT NULL,
    eliminado boolean,
    PRIMARY KEY (id_factura),
    CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
        REFERENCES public.cliente (id_cliente) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE public.factura
    OWNER to postgres;

CREATE TABLE public.productos_por_factura
(
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT id_factura FOREIGN KEY (id_factura)
        REFERENCES public.factura (id_factura) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT id_producto FOREIGN KEY (id_producto)
        REFERENCES public.producto (id_producto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

ALTER TABLE public.productos_por_factura
    OWNER to postgres;



-- se carga la base de datos


INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (1, 'TI', 321654987);
INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (2, 'CC', 13658);
INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (3, 'CC', 6517973);
INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (4, 'TI', 6428615);
INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (5, 'CC', 7984624);
INSERT INTO public.documento(
	id_documento, tipo_documento, numero_documento)
	VALUES (6, 'CC', 264789);


INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (101, 'ALEJANDRO', 1);
INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (102, 'CAMILA', 2);
INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (103, 'RONALD', 3);
INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (104, 'JESICA', 4);
INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (105, 'CLARA', 5);
INSERT INTO public.cliente(
	id_cliente, nombre, id_documento)
	VALUES (106, 'MARCOS', 6);


INSERT INTO public.producto(
	id_producto, nombre, precio)
	VALUES (1001, 'GASEOSA', 5000);
INSERT INTO public.producto(
	id_producto, nombre, precio)
	VALUES (1002, 'CERVEZA', 3500);
INSERT INTO public.producto(
	id_producto, nombre, precio)
	VALUES (1003, 'PAPITAS', 1700);
	INSERT INTO public.producto(
	id_producto, nombre, precio)
	VALUES (1004, 'MANI', 1000);
INSERT INTO public.producto(
	id_producto, nombre, precio)
	VALUES (1005, 'TRIDENT', 3800);


INSERT INTO public.proveedor(
	id_proveedor, nombre, direccion)
	VALUES (10001, 'POSTOBON SAS', 'ANTIOQUIA');
INSERT INTO public.proveedor(
	id_proveedor, nombre, direccion)
	VALUES (10002, 'BABARIA SAS', 'BOGOTA');
INSERT INTO public.proveedor(
	id_proveedor, nombre, direccion)
	VALUES (10003, 'PAPAS MARGARITA SAS', 'BOGOTA');
INSERT INTO public.proveedor(
	id_proveedor, nombre, direccion)
	VALUES (10004, 'NUTRESA SAS', 'ANTIOQUIA');
INSERT INTO public.proveedor(
	id_proveedor, nombre, direccion)
	VALUES (10005, 'MONDELEZ SAS', 'BOGOTA');

INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1001, 10001);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1002, 10002);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1003, 10003);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1004, 10004);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1005, 10005);

INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1001, 10001);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1002, 10002);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1003, 10003);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1004, 10004);
INSERT INTO public.registro_proveedor_producto(
	id_producto, id_proveedor)
	VALUES (1005, 10005);



INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6531, 101, 5, false);
INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6532, 101, 0, false);
INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6534, 102, 25, false);
INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6533, 104, 3, false);
INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6535, 104, 0, false);
INSERT INTO public.factura(
	id_factura, id_cliente, porcentaje_descuento, eliminado)
	VALUES (6536, 104, 30, false);




INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6531, 1001, 2);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6531, 1002, 5);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6531, 1003, 6);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6533, 1001, 1);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6533, 1002, 6);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6532, 1004, 3);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6532, 1005, 2);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6534, 1002, 7);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6534, 1003, 1);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6534, 1001, 2);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6534, 1002, 4);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6535, 1002, 1);
INSERT INTO public.productos_por_factura(
	id_factura, id_producto, cantidad)
	VALUES (6536, 1004, 6);


--- borrado logico y fisico en facturas

UPDATE public.factura
	SET  eliminado=true
	WHERE id_factura=6531 ;
UPDATE public.factura
	SET  eliminado=true
	WHERE id_factura=6533 ;

DELETE FROM public.productos_por_factura
	WHERE id_factura=6534;
DELETE FROM public.factura
	WHERE id_factura=6534;

DELETE FROM public.productos_por_factura
	WHERE id_factura=6531;
DELETE FROM public.factura
	WHERE id_factura=6531;

--actualizaciones 

UPDATE public.proveedor
	SET nombre='TUTI FRUTI SAS', direccion = 'BOYACA'
	WHERE id_proveedor=1001;
UPDATE public.proveedor
	SET nombre='LICORES DE ANTIOQUIA ', direccion = 'ANTIOQUIA'
	WHERE id_proveedor=1002;
UPDATE public.proveedor
	SET nombre='NACIONAL DE CHOCOLATES SAS', direccion = 'ANTIOQUIA'
	WHERE id_proveedor=1004;

UPDATE public.producto
	SET nombre='JUGO', precio=3500
	WHERE id_producto=1001;
UPDATE public.producto
	SET nombre='RON', precio=50000
	WHERE id_producto=1002;
UPDATE public.producto
	SET nombre='GOMAS', precio=500
	WHERE id_producto=1004;
