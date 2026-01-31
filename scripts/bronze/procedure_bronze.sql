/*
Stored procedre:Load Bronze layer (source->bronze)
==================================================
Script purpose:
      This stored procedure loads data into 'bronze' schema from external CSV files.
      It performs the following actions:
      - Truncates the bronze tables before loading data.
      - Uses the 'BULK_INSERT' command to load data from csv files to bronze tables.

Parameters:
  None
  This stored procedure does not accept any paramenters or return any values.

Usage example:
  EXEC bronze.load_bronze;
*/  


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME ,@end_time DATETIME
    BEGIN TRY
---Full Load---
    SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info

	BULK INSERT bronze.crm_cust_info
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	SET @end_time = GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'


---Full Load---
    SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_prd_info

	BULK INSERT bronze.crm_prd_info
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	)
	SET @end_time = GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'



	---Full load---
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_sales_details

	BULK INSERT bronze.crm_sales_details
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	)
	SET @end_time=GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'


	---Full load---
	SET @start_time=GETDATE();
	TRUNCATE TABLE bronze.erp_loc_a101

	BULK INSERT bronze.erp_loc_a101
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	)
	SET @end_time=GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'


	---Full load---
	SET @start_time=GETDATE();
	TRUNCATE TABLE bronze.erp_cust_az12

	BULK INSERT bronze.erp_cust_az12
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	)
	SET @end_time=GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'


---Full load---
    SET @start_time=GETDATE();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2

	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'D:\Data Engineer - 2026\DataWareHouse\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	)
	SET @end_time=GETDATE();
	PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+ 'seconds';
	PRINT '---------------------------------------------------------------------------------------'

	END TRY
	BEGIN CATCH
	  PRINT '---ERROR OCCURED---'
    END CATCH
   
END
