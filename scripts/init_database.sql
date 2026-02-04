/*
==============================================================
Create Database and Schemas
==============================================================
script purpose:
	This script creates a new database named 'DataWarehouse' after checking for its existence.
	if the database already exists, it will be dropped and recreated.
	also, it creates three schemas: 'bronze', 'silver', and 'gold' within the database.

WARNING: executing this script will result in the loss of all existing data in the 'DataWarehouse' database if it already exists.
instead of dropping the database, consider backing up any important data before running this script.
	*/

	USE master;
	GO

	-- Drop and recreate the 'DataWarehouse' database
	IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
	BEGIN
		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse;
	END;
	GO

	-- create the 'DataWarehouse' database
	CREATE DATABASE DataWarehouse;
	GO

	-- switch context to the 'DataWarehouse' database
	USE DataWarehouse;
	GO

	-- create the schemas
	CREATE SCHEMA bronze;
	GO

	CREATE SCHEMA silver;
	GO

	CREATE SCHEMA gold;
	GO

