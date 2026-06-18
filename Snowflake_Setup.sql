-- =========================================
-- Global Sales Performance Dashboard
-- Snowflake Setup Script
-- =========================================

-- Create Database
CREATE DATABASE SALES_DB;

-- Create Schema
CREATE SCHEMA SALES_DB.SALES_SCHEMA;

-- Create Warehouse
CREATE WAREHOUSE SALES_WH
WITH WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60;

-- Use Database, Schema and Warehouse
USE DATABASE SALES_DB;
USE SCHEMA SALES_SCHEMA;
USE WAREHOUSE SALES_WH;

-- Create Table
CREATE TABLE SALES_2014 (
    fSalesPrimaryKey NUMBER,
    ProductID NUMBER,
    SalesRepID NUMBER,
    Location STRING,
    Date STRING,
    Units NUMBER,
    PercentOfStandardCost FLOAT,
    RevenueDiscount FLOAT
);

-- Create Stage
CREATE STAGE SALES_STAGE;

-- Load CSV Data
COPY INTO SALES_2014
FROM @SALES_STAGE
FILE_FORMAT = (
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);

-- Verify Data
SELECT COUNT(*) AS TOTAL_ROWS
FROM SALES_2014;