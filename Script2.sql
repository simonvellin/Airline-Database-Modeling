drop table if exists Customer cascade;
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table if exists Aircraft cascade;
CREATE TABLE Aircraft (
    aircraft_id SERIAL PRIMARY KEY,
    aircraft_type VARCHAR(50),
    aircraft_company VARCHAR(50),
    capacity INT,
    registration_number VARCHAR(20) UNIQUE
);

drop table if EXISTS aircraft_slot cascade;
CREATE TABLE aircraft_slot (
	slot_id VARCHAR(10) PRIMARY KEY,
	aircraft_id INTEGER NOT NULL REFERENCES aircraft (aircraft_id), -- REFERENCES aircraft
	start_time TIMESTAMP NOT NULL,
	end_time TIMESTAMP NOT NULL,
	slot_type VARCHAR(20) NOT NULL CHECK (slot_type IN ('Flight', 'Maintenance')),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

drop table if exists Flight cascade;
CREATE TABLE Flight (
	flight_id VARCHAR(10) PRIMARY KEY REFERENCES aircraft_slot (slot_id), -- flight inherits PRIMARY KEY FROM slot
	origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
   	date DATE NOT NULL,
	flight_status VARCHAR(20) CHECK (flight_status IN ('Scheduled', 'Delayed', 'Cancelled')) DEFAULT 'Scheduled',
    operating_airline VARCHAR(50),
    available_seats INT CHECK (available_seats >= 0)
);

drop table if exists Booking cascade;
CREATE TABLE Booking (
	booking_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES Customer(customer_id), -- REFERENCES customer 
    flight_id VARCHAR(10) NOT NULL REFERENCES Flight (flight_id), -- REFERENCES the flight via slot_id
   	seat_class VARCHAR(20),
   	seat_number VARCHAR(5),
   	price DECIMAL(10, 2),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid', 'Pending', 'Cancelled')) DEFAULT 'Pending',
   	booking_status VARCHAR(20) CHECK (booking_status IN ('Active', 'Cancelled')) DEFAULT 'Active',
   	booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   	UNIQUE (flight_id, seat_number, booking_status) -- prevent double bookings
);

DROP TABLE IF EXISTS maintenance_event CASCADE;
CREATE TABLE maintenance_event (
	event_id VARCHAR(10) PRIMARY KEY REFERENCES aircraft_slot (slot_id), -- inherits PRIMARY KEY FROM slot_id
   	airport_code VARCHAR(5) NOT NULL,
   	subsystem_code VARCHAR(20) NOT NULL,
   	event_type VARCHAR(3) NOT NULL CHECK (event_type IN ('AOS' ,'OI'))
);

DROP TABLE IF EXISTS operational_interruption CASCADE;
CREATE TABLE operational_interruption (
	event_id VARCHAR(10) PRIMARY KEY REFERENCES maintenance_event(event_id),
	flight_id VARCHAR(10) NOT NULL REFERENCES flight (flight_id),
	interruption_type VARCHAR(20) NOT NULL CHECK (interruption_type IN ('DELAY',  'SAFETY')),
	delay_minutes INTEGER CHECK (delay_minutes >= 0) 
); 

DROP TABLE IF EXISTS aircraft_out_of_service CASCADE;
CREATE TABLE aircraft_out_of_service (
    event_id VARCHAR(10)  PRIMARY KEY REFERENCES maintenance_event (event_id),
	service_type VARCHAR(20) NOT NULL CHECK (service_type IN ('MAINTENANCE', 'REVISION')),
	duration INTEGER NOT NULL CHECK (
	(service_type = 'MAINTENANCE' AND duration BETWEEN 1 AND 24) OR
	(service_type = 'REVISION' AND duration BETWEEN 1 AND 30)
   	),
	duration_unit VARCHAR(10) NOT NULL CHECK (
	(service_type = 'MAINTENANCE' AND duration_unit = 'HOURS') OR
 	(service_type = 'REVISION' AND duration_unit = 'DAYS')
   	)
);

DROP TABLE IF EXISTS work_order CASCADE;
CREATE TABLE  work_order (
	work_order_id SERIAL PRIMARY KEY,
	event_id VARCHAR(10) NOT NULL REFERENCES maintenance_event (event_id),
	execution_place VARCHAR(100) NOT NULL,
	execution_date TIMESTAMP NOT NULL,
	work_kind VARCHAR(20) NOT NULL CHECK (work_kind IN ('Scheduled', 'Unscheduled')),
	duration_hours INT,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
); 

DROP TABLE IF EXISTS work_order_scheduled CASCADE;
CREATE TABLE  work_order_scheduled (
	work_order_id INTEGER PRIMARY KEY REFERENCES work_order (work_order_id),
	forecasted_date TIMESTAMP NOT NULL,
	forecasted_manhours INTEGER NOT NULL CHECK (forecasted_manhours > 0),
	frequency INTEGER 
); 

DROP TABLE IF EXISTS work_order_unscheduled CASCADE;
CREATE TABLE work_order_unscheduled (
	work_order_id INTEGER PRIMARY KEY REFERENCES work_order (work_order_id),
	reporter_class VARCHAR(50) NOT NULL,
	reporter_id VARCHAR(50) NOT NULL,
	due_date TIMESTAMP NOT NULL
); 


drop table if exists Flight_schedule cascade;
CREATE TABLE Flight_schedule (
    schedule_id SERIAL PRIMARY KEY,
    flight_id VARCHAR(10) REFERENCES Flight(flight_id),
    actual_departure_time TIMESTAMP,
    actual_arrival_time TIMESTAMP,
    delay_code VARCHAR(10),
    num_passengers INT,
    num_cabin_crew INT,
    num_flight_crew INT,
    is_cancelled BOOLEAN DEFAULT FALSE
);

drop table if exists Aircraft_inventory cascade;
CREATE TABLE Aircraft_inventory (
    inventory_id SERIAL PRIMARY KEY,
    aircraft_id INT REFERENCES Aircraft(aircraft_id),
    available BOOLEAN DEFAULT TRUE
);
