use tecnofull;

use mysql;

show tables;

select * from user;
alter user 'Romina' identified by 'Romina4899';
drop user 'rommibu@localhost';

RENAME USER 'romina@localhost' TO 'raquel@localhost';

SELECT * FROM mysql.user WHERE user LIKE 'raquel%';
SELECT * FROM mysql.user WHERE user LIKE 'romina%';

GRANT SELECT, INSERT, UPDATE ON Tecnofull.Cliente TO 'raquel@localhost';

GRANT ALL ON *.* TO 'romina';
SHOW GRANTS FOR 'romina';

CREATE USER 'tecnofull@localhost' IDENTIFIED BY 'tecnofull4899';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.cliente TO 'tecnofull@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.producto TO 'tecnofull@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.detallecompra TO 'tecnofull@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.detalleservicio TO 'tecnofull@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.detalleenvío TO 'tecnofull@localhost';
FLUSH PRIVILEGES;

USE TECNOFULL;
SHOW TABLES;

show grants for 'tecnofull@localhost';

REVOKE ALL PRIVILEGES ON *.* FROM 'raquel@localhost';

CREATE USER 'vendedor1@localhost' IDENTIFIED BY '4899';
GRANT ALL PRIVILEGES ON *.* TO 'vendedor1@localhost';
DROP USER 'tecnofull@localhost';
FLUSH PRIVILEGES;

show grants for 'vendedor1@localhost';

SELECT Host, User FROM mysql.user WHERE User='vendedor1';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'vendedor1@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.Cliente TO 'vendedor1@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.Producto TO 'vendedor1@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.Detallecompra TO 'vendedor1@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.Detalleservicio TO 'vendedor1@localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON TECNOFULL.Detalleenvío TO 'vendedor1@localhost';
FLUSH PRIVILEGES;

ALTER USER 'vendedor1@localhost' IDENTIFIED BY 'vendedor4899';
FLUSH PRIVILEGES;

-- Creo una nueva tabla para realizar graficos descriptivos de mi Base Tecnofull
CREATE TABLE ResumenVentas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    EmpleadoID INT,
    CategoriaID INT,
    ProductoID INT,
    TotalVentas DECIMAL(10, 2) NOT NULL,
    CantidadVendida INT NOT NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(ID),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(ID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ID)
);
USE tecnofull;  
SHOW TABLES;

DESCRIBE venta;

-- Agrupo todas las ventas por mes y suma el monto de las ventas por cada mes
CREATE VIEW VentasPorMes AS
SELECT
    DATE_FORMAT(Fecha, '%Y-%m') AS Mes,
    SUM(Monto) AS TotalVentas
FROM
    Venta
GROUP BY
    DATE_FORMAT(Fecha, '%Y-%m');
    
    -- Para mantener los registros y que la tabla se actualice
  CREATE TABLE VentasMensuales (
    Mes VARCHAR(7) NOT NULL,
    TotalVentas DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Mes)
);  

INSERT INTO VentasMensuales (Mes, TotalVentas)
SELECT Mes, TotalVentas
FROM VentasPorMes;

SELECT * FROM VentasMensuales;

describe venta;
INSERT INTO Venta (Fecha, Monto, EmpleadoID, ClienteID) 
VALUES
	('2024-01-01', 150.50, 1, 1),
	('2024-01-02', 200.00, 2, 2),
	('2024-01-03', 350.75, 3, 3),
	('2024-01-04', 400.00, 1, 4),
	('2024-01-05', 125.25, 2, 5),
	('2024-01-06', 275.50, 3, 6),
	('2024-01-07', 180.75, 1, 7),
	('2024-01-08', 220.00, 2, 8),
	('2024-01-09', 300.00, 3, 9),
	('2024-01-10', 250.00, 1, 10);

SELECT * FROM venta;