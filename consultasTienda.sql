USE tienda;

/*Consultes tienda*/
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio as euros, precio*0.88 AS dolares FROM producto;
SELECT nombre AS nom_del_producte, precio AS euros, precio*0.88 as dolars FROM producto;
SELECT UPPER (nombre) AS nombre, precio FROM producto;
SELECT LOWER (nombre) AS nombre, precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre, ROUNDprecio(precio) FROM producto;
SELECT nombre, FLOOR(precio) FROM producto;
SELECT codigo_fabricante FROM producto WHERE nombre IS NOT NULL;
SELECT DISTINCT codigo_fabricante FROM producto WHERE nombre IS NOT NULL;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT  * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre AS producto, precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre AS producto, precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre AS producto , producto.codigo_fabricante, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT producto.nombre AS producto, precio, fabricante.nombre AS fabricante from producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY precio ASC LIMIT 1; 
SELECT producto.nombre AS producto, precio, fabricante.nombre AS fabricante from producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY precio DESC LIMIT 1; 
SELECT * FROM producto JOIN fabricante 	ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'Lenovo';
SELECT * FROM producto JOIN fabricante 	ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'Crucial' AND precio>200;
SELECT * FROM producto JOIN fabricante 	ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'Asus' OR  fabricante.nombre LIKE 'Hewlett%';
SELECT * FROM producto JOIN fabricante 	ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN('ASUS','Hewlett-Packard');
SELECT producto.nombre, precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre AS producto, precio, fabricante.nombre AS fabricante FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE precio > 180 ORDER BY precio DESC, producto.nombre ASC;
SELECT * FROM fabricante JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT * FROM fabricante  LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT * FROM fabricante  LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo IS NULL;
/*em salto la consulta número 37*/
SELECT * FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'Lenovo' ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE 'Hewlett%' ORDER BY precio ASC LIMIT 1;
/*falten consultes 40 i 41*/
