-- 02_business_questions.sql
-- 15 business questions on the hotel reservation data.
-- Database: IBM Db2 | Table: HOTEL_RESERVATION_DATASET

-- Q1. Total number of reservations
SELECT COUNT(*) AS total_reservations
FROM HOTEL_RESERVATION_DATASET;

-- Q2. Most popular meal plan (full breakdown with share of bookings)
SELECT type_of_meal_plan,
       COUNT(*) AS bookings,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM HOTEL_RESERVATION_DATASET
GROUP BY type_of_meal_plan
ORDER BY bookings DESC;

-- Q3. Average price per room for reservations including children
SELECT ROUND(AVG(avg_price_per_room), 2) AS avg_price_with_children
FROM HOTEL_RESERVATION_DATASET
WHERE no_of_children > 0;

-- Q4. Reservations with arrival year 2018
SELECT COUNT(*) AS reservations_2018
FROM HOTEL_RESERVATION_DATASET
WHERE YEAR(arrival_date) = 2018;

-- Q5. Most commonly booked room type (full breakdown)
SELECT room_type_reserved,
       COUNT(*) AS bookings,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM HOTEL_RESERVATION_DATASET
GROUP BY room_type_reserved
ORDER BY bookings DESC;

-- Q6. Reservations that include weekend nights
SELECT COUNT(*) AS weekend_reservations
FROM HOTEL_RESERVATION_DATASET
WHERE no_of_weekend_nights > 0;

-- Q7. Highest and lowest lead time (days)
SELECT MAX(lead_time) AS highest_lead_time,
       MIN(lead_time) AS lowest_lead_time
FROM HOTEL_RESERVATION_DATASET;

-- Q8. Most common market segment (full breakdown)
SELECT market_segment_type,
       COUNT(*) AS bookings,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_total
FROM HOTEL_RESERVATION_DATASET
GROUP BY market_segment_type
ORDER BY bookings DESC;

-- Q9. Reservations by booking status
-- NOTE: the original query filtered on 'Confirmed' and returned 0, because that
-- value does not exist. Check the real values first, then filter on one of them.
SELECT booking_status, COUNT(*) AS reservations
FROM HOTEL_RESERVATION_DATASET
GROUP BY booking_status;
-- TODO: replace the value below with one returned above (e.g. 'Not_Canceled')
-- SELECT COUNT(*) FROM HOTEL_RESERVATION_DATASET WHERE booking_status = '<value>';

-- Q10. Total adults and children
SELECT SUM(no_of_adults) AS total_adults,
       SUM(no_of_children) AS total_children
FROM HOTEL_RESERVATION_DATASET;

-- Q11. Average weekend nights for reservations with children
-- CAST to DECIMAL: Db2 truncates averages of integer columns.
SELECT ROUND(AVG(CAST(no_of_weekend_nights AS DECIMAL(5,2))), 2) AS avg_weekend_nights_with_children
FROM HOTEL_RESERVATION_DATASET
WHERE no_of_children > 0;

-- Q12. Reservations per month (all years, so nothing is left out)
SELECT YEAR(arrival_date) AS yr,
       MONTH(arrival_date) AS mth,
       COUNT(*) AS reservations
FROM HOTEL_RESERVATION_DATASET
GROUP BY YEAR(arrival_date), MONTH(arrival_date)
ORDER BY yr, mth;

-- Q13. Average nights (weekend + weekday) per room type
SELECT room_type_reserved,
       ROUND(AVG(CAST(no_of_weekend_nights + no_of_week_nights AS DECIMAL(5,2))), 2) AS avg_nights
FROM HOTEL_RESERVATION_DATASET
GROUP BY room_type_reserved
ORDER BY avg_nights DESC;

-- Q14. Most common room type for reservations with children, and its average price
WITH child_reservations AS (
    SELECT room_type_reserved, avg_price_per_room
    FROM HOTEL_RESERVATION_DATASET
    WHERE no_of_children > 0
)
SELECT room_type_reserved,
       COUNT(*) AS child_reservations,
       ROUND(AVG(avg_price_per_room), 2) AS avg_price
FROM child_reservations
GROUP BY room_type_reserved
ORDER BY child_reservations DESC
LIMIT 1;

-- Q15. Market segment with the highest average price per room (all segments shown)
SELECT market_segment_type,
       ROUND(AVG(avg_price_per_room), 2) AS avg_price_per_room
FROM HOTEL_RESERVATION_DATASET
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC;
