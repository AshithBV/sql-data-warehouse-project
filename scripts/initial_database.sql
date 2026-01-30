/* 
==============================================================================
Create Database and Schema
==============================================================================
Script purpose:
       This script creates a new database named 'DataWarehouse' after checking if it is already exists.
       If the database exists , it is dropped and recreated .
       Additionally , the script sets up three schemas within the database : 
       'bronze','silver' and 'gold'.
*/

USE Master;
Go

---Drop and recreate the 'DataWarehouse' database---
IF EXISTS (SELECT 1 FROM sys.database WHERE name='DataWarehouse')
BEGIN 
   ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
   DROP DATABASE DataWarehouse;
END;
GO

---Create the 'DataWarehouse' database---

CREATE DATABASE DataWarehouse;
GO

USE DataWareHouse;
GO

---Create schema 'bronze'---
CREATE SCHEMA bronze;
GO

---Create schema 'silver'---
CREATE SCHEMA silver;
GO

---Create schema 'gold'---
CREATE SCHEMA gold;
GO
