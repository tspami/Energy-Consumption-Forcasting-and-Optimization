CREATE DATABASE energy_consumption_db;
USE energy_consumption_db;

-- Letting MySQL to create a table by Right-click your database, Click Table Data Import Wizard, Choose the file and Click create new table name the table, Click next-next-finish. 
DESCRIBE energy_raw;

-- duplicate creation
CREATE TABLE energy_clean AS SELECT * FROM energy_raw;
SELECT COUNT(*) FROM energy_clean;
ALTER TABLE energy_clean
CHANGE `ï»¿user_type` user_type VARCHAR(50);
DESCRIBE energy_clean;

-- 1.BASIC EXPLORATORY

SELECT COUNT(*) AS total_records FROM energy_clean;
SELECT * FROM energy_clean LIMIT 10;

-- 2.ENERGY CONSUMPTION ANALYSIS

-- Average Daily & Monthly Consumption
SELECT
    ROUND(AVG(daily_energy_kwh), 2) AS avg_daily_kwh,
    ROUND(AVG(monthly_energy_kwh), 2) AS avg_monthly_kwh
FROM energy_clean;

-- Consumption by User Type
SELECT
    user_type,
    ROUND(AVG(monthly_energy_kwh), 2) AS avg_monthly_kwh
FROM energy_clean
GROUP BY user_type;

-- Consumption by Location
SELECT
    location_type,
    ROUND(SUM(monthly_energy_kwh), 2) AS total_monthly_kwh
FROM energy_clean
GROUP BY location_type;

-- 3.PEAK USAGE & BEHAVIOR ANALYSIS

-- Peak Usage Time Pattern
SELECT
    peak_usage_time,
    ROUND(AVG(daily_energy_kwh), 2) AS avg_daily_kwh
FROM energy_clean
GROUP BY peak_usage_time
ORDER BY avg_daily_kwh DESC;

-- 4.RENEWABLE ENERGY INSIGHTS

-- Renewable vs Non-Renewable Users
SELECT
    renewable_energy_used,
    COUNT(*) AS user_count
FROM energy_clean
GROUP BY renewable_energy_used;

-- Renewable Impact on Consumption
SELECT
    renewable_energy_used,
    ROUND(AVG(monthly_energy_kwh), 2) AS avg_monthly_kwh
FROM energy_clean
GROUP BY renewable_energy_used;

-- 5.OCCUPANCY & USAGE RELATIONSHIP

-- Energy Usage vs Occupant Count
SELECT
    occupant_count,
    ROUND(AVG(monthly_energy_kwh), 2) AS avg_monthly_kwh
FROM energy_clean
GROUP BY occupant_count
ORDER BY occupant_count;

-- 6.HIGH CONSUMPTION IDENTIFICATION

-- Users Above Average Consumption
SELECT *
FROM energy_clean
WHERE monthly_energy_kwh >
      (SELECT AVG(monthly_energy_kwh) FROM energy_clean);
      
-- 7.CONSUMPTION CATEGORIZATION

-- Create Consumption Level
SELECT *, CASE
        WHEN monthly_energy_kwh < 200 THEN 'Low'
        WHEN monthly_energy_kwh BETWEEN 200 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS consumption_level
FROM energy_clean;

-- 8.FORECASTING-READY QUERY

-- Monthly Energy Trend
SELECT
    record_date,
    ROUND(SUM(monthly_energy_kwh), 2) AS total_monthly_kwh
FROM energy_clean
GROUP BY record_date
ORDER BY record_date;

-- 9️.ML SELECTION QUERY

CREATE TABLE energy_ml AS
SELECT
	user_type,
    location_type,
    occupant_count,
    primary_energy_source,
    renewable_energy_used,
    renewable_capacity_kw,
    peak_usage_time,
    avg_usage_hours_per_day,
    high_power_appliance_count,
    smart_meter_installed,
    energy_efficient_usage,
    optimization_awareness,
    target_reduction_pct,
    tariff_reasonability,
    daily_energy_kwh,
    monthly_energy_kwh,
    monthly_bill_inr,
    CASE
        WHEN monthly_energy_kwh < 200 THEN 'Low'
        WHEN monthly_energy_kwh BETWEEN 200 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS consumption_level
FROM energy_clean
WHERE daily_energy_kwh IS NOT NULL
  AND monthly_energy_kwh IS NOT NULL;

-- 10.EXPORTING AS CSV

SELECT * FROM energy_ml;