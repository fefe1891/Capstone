CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    driver_id VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(128) NOT NULL,
    phone_number VARCHAR(20),
    picture VARCHAR(255),
    activation_status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE earnings (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    week_earnings DECIMAL(10, 2),
    month_earnings DECIMAL(10, 2),
    year_earnings DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mileage (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    week_mileage DECIMAL(10, 2),
    month_mileage DECIMAL(10, 2),
    year_mileage DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trips (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    trip_date TIMESTAMP NOT NULL,
    distance DECIMAL(10, 2),
    duration INT,
    fare DECIMAL(10, 2),
    status VARCHAR(20)
);

CREATE TABLE tax_records (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    tax_year INT NOT NULL,
    total_earnings DECIMAL(10, 2),
    total_mileage DECIMAL(10, 2),
    deductions DECIMAL(10, 2),
    filing_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);