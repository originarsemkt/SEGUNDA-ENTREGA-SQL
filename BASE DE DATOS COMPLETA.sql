use tecnofull;

create database Tecnofull;
use Tecnofull;

-- Tabla Cliente
CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Empleado
CREATE TABLE Empleado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento VARCHAR(100),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Transporte
CREATE TABLE Transporte (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TipoTransporte VARCHAR(100),
    Descripción TEXT,
    Costo DECIMAL(10, 2)
);

-- tablas referenciadas
CREATE TABLE CategoríaProducto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Marca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Modelo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

 -- Tabla Producto
CREATE TABLE Producto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Precio DECIMAL(10, 2),
    CategoríaID INT,
    MarcaID INT,
    ModeloID INT,
    FOREIGN KEY (CategoríaID) REFERENCES CategoríaProducto(ID),
    FOREIGN KEY (MarcaID) REFERENCES Marca(ID),
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ID)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripción TEXT,
    Costo DECIMAL(10, 2)
);

-- Tabla Sucursal
CREATE TABLE Sucursal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Dueño
CREATE TABLE Dueño (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100)
);

-- Tabla Encargado
CREATE TABLE Encargado (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    SucursalID INT,
    Teléfono VARCHAR(20),
    CorreoElectrónico VARCHAR(100),
    FOREIGN KEY (SucursalID) REFERENCES Sucursal(ID)
);

CREATE TABLE DetalleCompra (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProductoID INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    FechaCompra DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ID)
);

CREATE TABLE DetalleServicio (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ServicioID INT,
    Descripción TEXT,
    Costo DECIMAL(10, 2),
    FechaServicio DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (ServicioID) REFERENCES Servicio(ID)
);

CREATE TABLE DetalleEnvío (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    TransporteID INT,
    DirecciónEntrega VARCHAR(255),
    FechaEnvío DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (TransporteID) REFERENCES Transporte(ID)
);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cliente (Nombre, Apellido, Dirección, Teléfono, CorreoElectrónico) 
VALUES
	('Juan', 'Pérez', 'Calle Falsa 123', '1234567890', 'juan.perez@example.com'),
	('Ana', 'García', 'Avenida Siempre Viva 456', '0987654321', 'ana.garcia@example.com'),
	('Luis', 'Martínez', 'Boulevard de los Sueños 789', '1122334455', 'luis.martinez@example.com'),
	('María', 'Rodríguez', 'Calle Luna 101', '6677889900', 'maria.rodriguez@example.com'),
	('Carlos', 'López', 'Calle Sol 202', '3344556677', 'carlos.lopez@example.com'),
	('Sofía', 'Gómez', 'Avenida Estrellas 303', '2233445566', 'sofia.gomez@example.com'),
	('Daniel', 'Fernández', 'Calle Mar 404', '7788990011', 'daniel.fernandez@example.com'),
	('Laura', 'Hernández', 'Avenida Cielo 505', '5566778899', 'laura.hernandez@example.com'),
	('David', 'Jiménez', 'Boulevard Tierra 606', '4455667788', 'david.jimenez@example.com'),
	('Andrea', 'Ruiz', 'Calle Viento 707', '9988776655', 'andrea.ruiz@example.com');

INSERT INTO Empleado (Nombre, Apellido, Cargo, Departamento, Teléfono, CorreoElectrónico) 
VALUES
	('Pedro', 'Torres', 'Gerente', 'Ventas', '1231231234', 'pedro.torres@example.com'),
	('Lucía', 'Vargas', 'Asistente', 'Ventas', '3213214321', 'lucia.vargas@example.com'),
	('Miguel', 'Castro', 'Técnico', 'Soporte', '2312312312', 'miguel.castro@example.com'),
	('Carla', 'Romero', 'Recepcionista', 'Atención al Cliente', '3123123123', 'carla.romero@example.com'),
	('José', 'Santos', 'Vendedor', 'Ventas', '1321321321', 'jose.santos@example.com'),
	('Tomás', 'Flores', 'Gerente', '', '3213213214', 'tomas.flores@example.com'),
	('Patricia', 'Silva', 'SocialMedia', 'Marketing', '1231234321', 'patricia.silva@example.com'),
	('Alberto', 'Morales', 'Programador', 'IT', '2312314321', 'alberto.morales@example.com'),
	('Verónica', 'Ortiz', 'Soporte', 'Soporte', '3123121231', 'veronica.ortiz@example.com');

INSERT INTO Proveedor (Nombre, Dirección, Teléfono, CorreoElectrónico) 
VALUES
	('Tecnoboss', 'Boulevard las heras 38', '3514123412', 'contacto@techsupplies.com'),
	('Innova Tech', 'Figueroa Alcorta 325', '3515234523', 'ventas@innovatech.com'),
	('Global Components', 'Sucre 521', '3516345634', 'info@globalcomponents.com'),
	('Distribuciones XYZ', 'Dena Funes 42', '3517456745', 'xyz@distribucionesxyz.com'),
	('ElectroWorld', 'La Rioja 820', '3518567856', 'contacto@electroworld.com'),
	('CompuParts', 'Santa Rosa 320', '3519678967', 'ventas@compuparts.com'),
	('Mega Tech', 'Rivadavia 35', '3510789078', 'info@megatech.com'),
	('Tecnología Global', 'Colon 381', '3511890189', 'contacto@tecnologiaglobal.com'),
	('Gadgets & More', 'Boulevard las heras 138', '3512901290', 'info@gadgetsandmore.com'),
	('Suministros Tecnológicos', 'La Rioja 163', '3513012301', 'ventas@suministros.com');

INSERT INTO Transporte (TipoTransporte, Descripción, Costo) 
VALUES
	('Uber', 'Herramientas y suministros', 150.00),
	('Moto', 'Motocicleta para envíos rápidos', 50.00),
	('Van', 'Furgoneta para entregas urbanas', 100.00),
	('Bicicleta', 'Bicicleta para entregas cercanas', 20.00),
	('Furgoneta', 'Furgoneta pequeña', 80.00),
	('Taxi', 'Taxi para envíos urgentes', 70.00);

INSERT INTO CategoríaProducto (Nombre) 
VALUES
	('Notebook'),
	('Celular'),
	('Tablet'),
	('Funda'),
	('Vidrio templado'),
	('cables'),
	('adaptadores'),
	('Cargadores'),
	('Baterias'),
	('Varios');
INSERT INTO Marca (Nombre) 
VALUES
	('Samsung'),
	('Apple'),
	('Sony'),
	('LG'),
	('HP'),
	('Dell'),
	('Xiaomi'),
	('CX'),
	('Motorola'),
	('Huawei');

INSERT INTO Modelo (Nombre) 
VALUES
	('Galaxy S21'),
	('iPhone 12'),
	('PlayStation 5'),
	('OLED'),
    ('Incell'),
	('Spectre x360'),
	('XPS 13'),
	('Air Max'),
	('Ultraboost'),
	('RS-X3'),
	('Nano X1');
    
INSERT INTO Producto (Nombre, Descripción, Precio, CategoríaID, MarcaID, ModeloID) 
VALUES
	('Teléfono móvil', 'Teléfono inteligente de última generación', 699.99, 1, 1, 1),
	('Laptop', 'Laptop de alto rendimiento', 1299.99, 2, 2, 2),
	('Consola de videojuegos', 'Consola de última generación', 499.99, 3, 3, 3),
	('Televisor', 'Televisor OLED 4K', 999.99, 4, 4, 4),
	('Impresora', 'Impresora multifuncional', 199.99, 5, 5, 5),
	('Monitor', 'Monitor de alta resolución', 299.99, 6, 6, 6),
	('Notebook', 'Corel I3 8g/256gb', 119.99, 7, 7, 7);

INSERT INTO Servicio (Nombre, Descripción, Costo) 
VALUES
	('Reparación de teléfonos', 'Servicio de reparación de teléfonos móviles', 49.99),
	('Mantenimiento de computadoras', 'Mantenimiento y limpieza de computadoras', 89.99),
	('Instalación de software', 'Instalación y configuración de software', 39.99),
	('Reparación de electrodomésticos', 'Servicio de reparación de electrodomésticos', 59.99),
	('Soporte técnico remoto', 'Asistencia técnica a distancia', 29.99),
	('Configuración de redes', 'Instalación y configuración de redes', 79.99),
	('Limpieza de virus', 'Eliminación de virus y malware', 69.99),
	('Recuperación de datos', 'Servicio de recuperación de datos', 99.99),
	('Asesoramiento tecnológico', 'Consultoría en tecnología y gadgets', 19.99),
	('Mantenimiento de impresoras', 'Servicio de mantenimiento de impresoras', 29.99);

INSERT INTO Sucursal (Nombre, Dirección, Teléfono, CorreoElectrónico) 
VALUES
	('Sucursal Central', 'Avenida Principal 100', '1231231234', 'central@tecnofull.com'),
	('Sucursal Norte', 'Calle Norte 200', '2342342345', 'norte@tecnofull.com'),
	('Sucursal Sur', 'Boulevard Sur 300', '3453453456', 'sur@tecnofull.com');

DESCRIBE Producto;
DESCRIBE Proveedor;

ALTER TABLE Producto ADD ProveedorID INT;

CREATE VIEW ArticulosProveedores AS
SELECT p.Nombre AS NombreProveedor, pr.Nombre AS NombreProducto, pr.Precio
FROM Producto pr
JOIN Proveedor p ON pr.ProveedorID = p.ID;

CREATE TABLE Venta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    EmpleadoID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(ID)
);

DESCRIBE venta;
DESCRIBE empleado;

CREATE VIEW VentasEmpleados AS
SELECT e.Nombre AS NombreEmpleado, e.Apellido AS ApellidoEmpleado, SUM(v.Monto) AS TotalVentas
FROM Empleado e
JOIN Venta v ON e.ID = v.EmpleadoID
GROUP BY e.ID;


DESCRIBE Cliente;


ALTER TABLE venta ADD ClienteID INT;

CREATE VIEW ClientesFrecuentes AS
SELECT c.ID AS ClienteID, c.Nombre, c.Apellido, COUNT(v.ID) AS TotalCompras
FROM cliente c
INNER JOIN venta v ON c.ID = v.ClienteID
GROUP BY c.ID, c.Nombre, c.Apellido
ORDER BY TotalCompras DESC;

ALTER TABLE producto ADD ProductoID INT;

CREATE VIEW ProductosMasVendidos AS
SELECT p.Nombre AS NombreProducto, COUNT(v.ID) AS VentasTotales
FROM Producto p
JOIN Venta v ON p.ID = p.ProductoID
GROUP BY p.ID
ORDER BY VentasTotales DESC;

ALTER TABLE transporte ADD ClienteID INT;

ALTER TABLE cliente
DROP COLUMN ClienteID;

CREATE VIEW DetalleEnvios AS
SELECT 
    t.ID AS TransporteID,
    t.TipoTransporte,
    t.Descripción,
    t.Costo,
    c.ID AS ClienteID,
    c.Nombre,
    c.Apellido,
    c.Dirección,
    c.Teléfono,
    c.CorreoElectrónico
FROM transporte t
INNER JOIN cliente c ON t.ID = t.ClienteID;

DELIMITER $$

CREATE FUNCTION total_VENDIDO_PORPRODUCTO(p_id_producto INT) 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT DEFAULT 0;
    SELECT IFNULL(SUM(cantidad), 0) INTO total
    FROM Detalle_Venta
    WHERE id_producto = p_id_producto;
    RETURN total;
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION OPERACION_POR_EMPLEADO (p_id_empleado INT) 
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Venta
    WHERE id_empleado = p_id_empleado;
    RETURN total;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE ordenarProducto (IN columna VARCHAR(50), IN orden VARCHAR(4))
BEGIN
    SET @sql = CONCAT('SELECT * FROM Producto ORDER BY ', columna, ' ', orden);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

DELIMITER $$
CREATE PROCEDURE agregar_eliminar_producto (
    IN p_accion VARCHAR(10),
    IN p_nombre VARCHAR(255),
    IN p_id_producto INT
)
BEGIN
    IF p_accion = 'agregar' THEN
        INSERT INTO Producto (nombre, existencia, precio, id_proveedor)
        VALUES (p_nombre, 0, 0, 1);  -- Asumo que el id_proveedor es 1 por defecto
    ELSEIF p_accion = 'eliminar' THEN
        DELETE FROM Producto WHERE id_producto = p_id_producto;
    END IF;
END;$$
DELIMITER ;

-- Tabla de log
CREATE TABLE movimientos_productos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    descripcion VARCHAR(255),
    existencia INT,
    precio DECIMAL(10,2),
    operacion VARCHAR(10),
    usuario VARCHAR(50),
    fecha DATETIME,
    antes_actualizacion BOOLEAN
);

DELIMITER $$
CREATE TRIGGER bef_upd_producto BEFORE UPDATE ON producto 
FOR EACH ROW 
BEGIN 
    INSERT INTO movimientos_producto (id_producto, descripcion, existencia, precio, operacion, usuario, fecha, antes_actualizacion) 
    VALUES (OLD.ID, OLD.Descripción, OLD.Precio, 'update', USER(), NOW(), TRUE); 
END$$
DELIMITER ;

-- Trigger after delete
DELIMITER $$
CREATE TRIGGER aft_del_producto AFTER DELETE ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO movimientos_producto (id_producto, descripcion, precio, operacion, usuario, fecha, antes_actualizacion)
    VALUES (OLD.ID, OLD.Descripción, OLD.Precio, 'delete', USER(), NOW(), FALSE);
END$$
DELIMITER ;

-- Tabla de log
CREATE TABLE movimientos_ventas (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    total DECIMAL(10,2),
    operacion VARCHAR(10),
    usuario VARCHAR(50),
    fecha DATETIME
);

-- Trigger before insert
DELIMITER $$
CREATE TRIGGER bef_ins_ventas
BEFORE INSERT ON Venta
FOR EACH ROW
BEGIN
    INSERT INTO movimientos_ventas (id_venta, total, operacion, usuario, fecha)
    VALUES (NEW.ID, NEW.Monto, 'insert', USER(), NOW());
END;$$
DELIMITER ;

-- Trigger after delete
DELIMITER $$
CREATE TRIGGER aft_del_ventas
AFTER DELETE ON Venta
FOR EACH ROW
BEGIN
    INSERT INTO movimientos_ventas (id_venta, total, operacion, usuario, fecha)
    VALUES (OLD.ID, OLD.Monto, 'delete', USER(), NOW());
END;$$
DELIMITER ;

use tecnofull;

select * from cliente;

