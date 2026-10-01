-- 01_data_quality_checks.sql
-- Run these BEFORE the analysis to know what the data looks like.
-- Database: IBM Db2 | Table: HOTEL_RESERVATION_DATASET

-- Row count (expected: 700)
SELECT COUNT(*) AS total_rows FROM HOTEL_RESERVATION_DATASET;

-- Duplicate booking IDs (expected: none)
SELECT Booking_ID, COUNT(*) AS times_seen
FROM HOTEL_RESERVATION_DATASET
GROUP BY Booking_ID
HAVING COUNT(*) > 1;

-- NULLs in key columns
SELECT
    SUM(CASE WHEN arrival_date IS NULL THEN 1 ELSE 0 END)        AS null_arrival_date,
    SUM(CASE WHEN avg_price_per_room IS NULL THEN 1 ELSE 0 END)  AS null_price,
    SUM(CASE WHEN booking_status IS NULL THEN 1 ELSE 0 END)      AS null_status,
    SUM(CASE WHEN lead_time IS NULL THEN 1 ELSE 0 END)           AS null_lead_time
FROM HOTEL_RESERVATION_DATASET;

-- Impossible values: no guests, zero or negative price
SELECT COUNT(*) AS suspicious_rows
FROM HOTEL_RESERVATION_DATASET
WHERE no_of_adults + no_of_children = 0
   OR avg_price_per_room <= 0;

-- Distinct values of categorical columns (found that "Confirmed" is not a valid status)
SELECT booking_status, COUNT(*) AS reservations
FROM HOTEL_RESERVATION_DATASET GROUP BY booking_status;

SELECT type_of_meal_plan, COUNT(*) AS reservations
FROM HOTEL_RESERVATION_DATASET GROUP BY type_of_meal_plan;

SELECT market_segment_type, COUNT(*) AS reservations
FROM HOTEL_RESERVATION_DATASET GROUP BY market_segment_type;

-- Date range covered by the sample
SELECT MIN(arrival_date) AS first_arrival, MAX(arrival_date) AS last_arrival
FROM HOTEL_RESERVATION_DATASET;
