-- Create table for ride data
CREATE TABLE ride_data (
    ride_id SERIAL PRIMARY KEY,
    pickup_location VARCHAR(255),
    dropoff_location VARCHAR(255),
    vehicle_type VARCHAR(50),
    fare_amount DECIMAL(10,2),
    payment_type VARCHAR(50),
    ride_status VARCHAR(50),
    ride_distance DECIMAL(10,2),
    ride_date DATE
);

-- Load data (Assuming CSV import is done externally)

-- Query to get total revenue
SELECT SUM(fare_amount) AS total_revenue FROM ride_data;

-- Query to get total rides count
SELECT COUNT(*) AS total_rides FROM ride_data;

-- Query to get revenue breakdown by vehicle type
SELECT vehicle_type, SUM(fare_amount) AS revenue
FROM ride_data
GROUP BY vehicle_type
ORDER BY revenue DESC;

-- Query to analyze payment method distribution
SELECT payment_type, COUNT(*) AS count FROM ride_data
GROUP BY payment_type;

-- Query to analyze ride cancellations
SELECT ride_status, COUNT(*) AS count FROM ride_data
WHERE ride_status IN ('Cancelled by Driver', 'Cancelled by Customer')
GROUP BY ride_status;
