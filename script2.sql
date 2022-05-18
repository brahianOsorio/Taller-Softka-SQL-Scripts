--se ejecuta en PostgreSQL 
--consultas 
--Consulta SQL donde pueda obtener los productos vendidos digitando tipo de documento y número de documento.

select e.nombre, d.tipo_documento , d.numero_documento,f.id_factura,f.porcentaje_descuento,f.eliminado,ppf.cantidad,pr.nombre,pr.precio
from cliente e 
JOIN documento d
on e.id_documento = d.id_documento
join factura f
on e.id_cliente = f.id_cliente
join productos_por_factura ppf
on f.id_factura = ppf.id_factura
join producto pr
on pr.id_producto = ppf.id_producto

where d.tipo_documento = 'TI' and d.numero_documento = 6428615


--Consultar productos por medio del nombre, el cual debe mostrar quien o quienes han sido sus proveedores.

select pr.id_producto,pr.nombre,pr.precio, pv.id_proveedor,pv.nombre,pv.direccion
from producto pr
JOIN registro_proveedor_producto rpp
on pr.id_producto = rpp.id_producto
join proveedor pv
ON pv.id_proveedor = rpp.id_proveedor

where pr.nombre = 'GOMAS'

