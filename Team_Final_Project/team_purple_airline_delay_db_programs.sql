-- //////////////////////////////////////////////////////////////////////////// --
--                                     VIEWS                                    --
-- //////////////////////////////////////////////////////////////////////////// --

-- View I | This will show the airports with total arrival delays over 10,000 minutes
-- __________________________________________________________________________________ --
DROP VIEW IF EXISTS view_top_delayed_airports;
CREATE VIEW view_top_delayed_airports AS
SELECT 
    ap.airport_code,
    ap.airport_name,
    SUM(f.arr_delay) AS total_delay
FROM flights f
JOIN airports ap ON f.airport_id = ap.airport_id
WHERE f.arr_delay IS NOT NULL
GROUP BY ap.airport_code, ap.airport_name
HAVING total_delay > 10000;

-- View II | This shows us the average delay duration by airline and delay cause
-- __________________________________________________________________________________ --
DROP VIEW IF EXISTS view_avg_delay_by_cause_airline;
CREATE VIEW view_avg_delay_by_cause_airline AS
SELECT a.carrier_name, c.cause, AVG(fc.avg_duration) AS avg_delay
FROM flights_causes fc
JOIN flights f ON fc.flight_id = f.flight_id
JOIN airlines a ON f.airline_id = a.airline_id
JOIN causes c ON fc.cause_id = c.cause_id
WHERE fc.avg_duration IS NOT NULL
GROUP BY a.carrier_name, c.cause
HAVING avg_delay > 5;

-- View III | This shows us the average delay duration by airline and delay cause
-- __________________________________________________________________________________ --
DROP VIEW IF EXISTS airports_above_average_flights;
CREATE VIEW airports_above_average_flights AS
	WITH airport_flight_count AS 
    (
		SELECT airport_name, city, state, COUNT(flight_id) AS total_flights
			FROM flights AS fl
			JOIN airports AS ap ON ap.airport_id = fl.airport_id
			JOIN location AS lc ON ap.location_id = lc.location_id
			GROUP BY airport_name, city, state
    )
    SELECT airport_name, city, state, total_flights
    FROM airport_flight_count
    WHERE total_flights >= (SELECT AVG(total_flights) FROM airport_flight_count);
    
-- View IV | This shows us the average delay duration by airline and delay cause
-- __________________________________________________________________________________ --
DROP VIEW IF EXISTS view_airlines_below_avg_delay;
CREATE VIEW view_airlines_below_avg_delay AS
SELECT 
    a.carrier_name,
    AVG(f.arr_delay) AS avg_airline_delay
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
WHERE f.arr_delay IS NOT NULL
GROUP BY a.carrier_name
HAVING avg_airline_delay < (
    SELECT AVG(arr_delay)
    FROM flights
    WHERE arr_delay IS NOT NULL
);


-- //////////////////////////////////////////////////////////////////////////// --
--                                     PROCEDURES                               --
-- //////////////////////////////////////////////////////////////////////////// --

-- Procedure I | A procedure which inputs a cause type and returns the total amount of delays in minutes for each state.
-- __________________________________________________________________________________ --
DROP PROCEDURE IF EXISTS total_delay_cause_and_state;
DELIMITER //
CREATE PROCEDURE total_delay_cause_and_state(IN cause_var VARCHAR(25))
BEGIN
    WITH cause_by_state AS 
    (
    SELECT state, cause, SUM(delay_count) AS total_delay_duration
	FROM flights AS fl
    JOIN airports AS ap ON fl.airport_id = ap.airport_id
    JOIN location AS lc ON lc.location_id = ap.location_id
    JOIN flights_causes AS fc ON fc.flight_id = fl.flight_id
    JOIN causes AS ca ON ca.cause_id = fc.cause_id
    GROUP BY state, cause
    ) 
    SELECT state, cause, total_delay_duration
	FROM cause_by_state
    WHERE cause = cause_var
    ORDER BY total_delay_duration DESC;
END//
DELIMITER ;
CALL total_delay_cause_and_state("weather");

-- Procedure II | This will return the average delay duration for each cause across all flights
-- __________________________________________________________________________________ --
DROP PROCEDURE IF EXISTS get_average_delay_by_cause;
DELIMITER //
CREATE PROCEDURE get_average_delay_by_cause()
BEGIN
    SELECT 
        c.cause,
        ROUND(AVG(fc.avg_duration), 2) AS average_delay_minutes
    FROM flights_causes fc
    JOIN causes c ON fc.cause_id = c.cause_id
    WHERE fc.avg_duration IS NOT NULL
    GROUP BY c.cause
    ORDER BY average_delay_minutes DESC;
END;
//
DELIMITER ;
CALL get_average_delay_by_cause;



-- //////////////////////////////////////////////////////////////////////////// --
--                                     FUNCTIONS                                --
-- //////////////////////////////////////////////////////////////////////////// --

-- Function I | This function generates a report of delay breakdowns per airport.
-- __________________________________________________________________________________ --
DROP FUNCTION IF EXISTS delay_report;
DELIMITER //
CREATE FUNCTION delay_report (airport VARCHAR(45), delay_cause VARCHAR(45), delay_amount INT, total_flights INT)
RETURNS VARCHAR (200)
DETERMINISTIC
BEGIN
	DECLARE delay_written_report VARCHAR(200);
	SET delay_written_report = CONCAT(ROUND(delay_amount/total_flights, 2), "% of delays at ", airport, " are caused by ", delay_cause);
	RETURN delay_written_report;
END//
DELIMITER ;

-- Example using a CTE table to filter breakdowns by cause.
WITH delay_info AS (
	SELECT airport_name, airport_code, cause, delay_report(airport_name, cause, SUM(delay_count), SUM(arr_flights)) AS report
		FROM flights AS fl
		JOIN airports  AS ap ON ap.airport_id = fl.airport_id
		JOIN flights_causes AS fc ON fc.flight_id = fl.flight_id
		JOIN causes AS ca ON ca.cause_id = fc.cause_id
		GROUP BY airport_name, airport_code, cause
    )
    SELECT report
    FROM delay_info
    WHERE cause = "weather";
    
    -- This example does the inverse by filtering by airport.
WITH delay_info AS (
	SELECT airport_name, airport_code, cause, delay_report(airport_name, cause, SUM(delay_count), SUM(arr_flights)) AS report
		FROM flights AS fl
		JOIN airports  AS ap ON ap.airport_id = fl.airport_id
		JOIN flights_causes AS fc ON fc.flight_id = fl.flight_id
		JOIN causes AS ca ON ca.cause_id = fc.cause_id
		GROUP BY airport_name, airport_code, cause
    )
    SELECT report
    FROM delay_info
    WHERE airport_code = "IAD";
    
-- Function II | A function that generates a written report for an airline's delay and cancellation performance.
-- __________________________________________________________________________________ --
DROP FUNCTION IF EXISTS airline_performance_reports;
DELIMITER //
CREATE FUNCTION airline_performance_reports (carrier_name VARCHAR(45), canceled_count INT, delayed_count INT, total_flights INT)
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
	DECLARE performance_report VARCHAR(200);
    SET performance_report = CONCAT(carrier_name, " has a ", ROUND(delayed_count/total_flights,2), "% delay percentage and a ", ROUND(canceled_count/total_flights,2), "% cancellation percentage.");
    RETURN performance_report;
END//
DELIMITER ;

-- Example
SELECT carrier_name, airline_performance_reports(carrier_name, SUM(arr_canceled), SUM(arr_delay), SUM(arr_flights)) AS performance_report
	FROM flights AS fl
    JOIN airlines AS ar ON ar.airline_id = fl.airline_id
    GROUP BY carrier_name;
