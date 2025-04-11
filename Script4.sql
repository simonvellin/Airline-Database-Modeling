INSERT INTO Customer (name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane Smith', 'jane.smith@example.com', '234-567-8901', '456 Oak Street'),
('Michael Johnson', 'm.johnson@example.com', '345-678-9012', '789 Pine Street'),
('Emily Davis', 'emily.davis@example.com', '456-789-0123', '135 Maple Avenue'),
('David Wilson', 'david.wilson@example.com', '567-890-1234', '246 Cedar Road'),
('Sarah Brown', 'sarah.brown@example.com', '678-901-2345', '357 Spruce Drive'),
('Chris Miller', 'chris.miller@example.com', '789-012-3456', '468 Birch Boulevard'),
('Amanda Taylor', 'amanda.taylor@example.com', '890-123-4567', '579 Walnut Lane'),
('Daniel Moore', 'daniel.moore@example.com', '901-234-5678', '680 Cherry Street'),
('Jessica Anderson', 'j.anderson@example.com', '012-345-6789', '791 Fir Avenue');

INSERT INTO Aircraft (aircraft_id,aircraft_type, aircraft_company, capacity, registration_number) VALUES
(1,'Boeing 737', 'Boeing', 180, 'B737-001'),
(2,'Airbus A320', 'Airbus', 160, 'A320-002'),
(3,'Boeing 747', 'Boeing', 366, 'B747-003'),
(4,'Embraer E190', 'Embraer', 100, 'E190-004'),
(5,'Airbus A330', 'Airbus', 250, 'A330-005'),
(6,'Boeing 787', 'Boeing', 296, 'B787-006'),
(7,'Bombardier CRJ700', 'Bombardier', 78, 'CRJ700-007'),
(8,'Airbus A380', 'Airbus', 500, 'A380-008'),
(9,'Boeing 757', 'Boeing', 239, 'B757-009'),
(10,'Airbus A340', 'Airbus', 375, 'A340-010'),
(11,'Boeing 737', 'Boeing', 180, 'B737-101'),
(12,'Airbus A320', 'Airbus', 160, 'A320-102'),
(13,'Boeing 747', 'Boeing', 366, 'B747-103'),
(14,'Embraer E190', 'Embraer', 100, 'E190-104'),
(15,'Airbus A330', 'Airbus', 250, 'A330-105'),
(16,'Boeing 787', 'Boeing', 296, 'B787-106'),
(17,'Bombardier CRJ700', 'Bombardier', 78, 'CRJ700-107'),
(18,'Airbus A380', 'Airbus', 500, 'A380-108'),
(20,'Boeing 757', 'Boeing', 239, 'B757-109');


INSERT INTO Aircraft_slot (slot_id, aircraft_id, slot_type, start_time, end_time) VALUES
('FL001',1, 'Flight', '2024-12-01 07:00:00', '2024-12-01 17:00:00'),
('FL002',2, 'Flight', '2024-12-01 09:00:00', '2024-12-02 18:00:00'),
('FL003' ,3, 'Flight', '2024-12-02 09:00:00', '2024-12-02 18:00:00'),
('FL004' ,4, 'Flight', '2024-12-02 09:00:00', '2024-12-02 18:00:00'),
('FL005' ,5, 'Flight', '2024-12-03 09:00:00', '2024-12-02 18:00:00'),
('FL006' ,6, 'Flight', '2024-12-03 09:00:00', '2024-12-02 18:00:00'),
('FL007' ,7, 'Flight', '2024-12-04 09:00:00', '2024-12-02 18:00:00'),
('FL008' ,8, 'Flight', '2024-12-04 09:00:00', '2024-12-02 18:00:00'),
('FL009' ,9, 'Flight', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('FL010' ,10, 'Flight', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('AO1' ,11, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('AO2' ,12, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('AO3' ,13, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('AO4' ,14, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('OI1' ,15, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('OI2' ,16, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('OI3' ,17, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00'),
('OI4' ,18, 'Maintenance', '2024-12-05 09:00:00', '2024-12-02 18:00:00');


INSERT INTO Flight (flight_id, origin, destination, date, flight_status, operating_airline, available_seats) VALUES
('FL001', 'LAX', 'JFK', '2024-12-01', 'Scheduled', 'Airline A', 180),
('FL002', 'JFK', 'LAX', '2024-12-01', 'Scheduled', 'Airline A', 160),
('FL003', 'LAX', 'ORD', '2024-12-02', 'Scheduled', 'Airline B', 366),
('FL004', 'ORD', 'LAX', '2024-12-02', 'Delayed', 'Airline B', 100),
('FL005', 'LAX', 'SFO', '2024-12-03', 'Scheduled', 'Airline C', 250),
('FL006', 'SFO', 'LAX', '2024-12-03', 'Cancelled', 'Airline C', 296),
('FL007', 'LAX', 'SEA', '2024-12-04', 'Scheduled', 'Airline D', 78),
('FL008', 'SEA', 'LAX', '2024-12-04', 'Scheduled', 'Airline D', 500),
('FL009', 'LAX', 'DEN', '2024-12-05', 'Scheduled', 'Airline E', 239),
('FL010', 'DEN', 'LAX', '2024-12-05', 'Scheduled', 'Airline E', 375);


INSERT INTO Booking (customer_id, flight_id, seat_class, seat_number, price, payment_status, booking_status, booking_date) VALUES
(1, 'FL001', 'Economy', '12A', 200.00, 'Paid', 'Active', '2024-11-01'),
(2, 'FL002', 'Business', '3C', 500.00, 'Paid', 'Active', '2024-11-02'),
(3, 'FL003', 'First', '1A', 800.00, 'Pending', 'Active', '2024-11-03'),
(4, 'FL004', 'Economy', '22B', 180.00, 'Paid', 'Active', '2024-11-04'),
(5, 'FL005', 'Economy', '15D', 150.00, 'Paid', 'Cancelled', '2024-11-05'),
(6, 'FL006', 'Business', '2B', 600.00, 'Cancelled', 'Cancelled', '2024-11-06'),
(7, 'FL007', 'Economy', '16E', 220.00, 'Paid', 'Active', '2024-11-07'),
(8, 'FL008', 'First', '1B', 900.00, 'Pending', 'Active', '2024-11-08'),
(9, 'FL009', 'Economy', '18F', 210.00, 'Paid', 'Active', '2024-11-09'),
(10, 'FL010', 'Economy', '20C', 175.00, 'Pending', 'Active', '2024-11-10');

INSERT INTO Maintenance_event (event_id, airport_code, subsystem_code, event_type) VALUES
('AO1', 'JFK', 'SYS000', 'AOS'),
('AO2', 'LAX', 'SYS001', 'AOS'),
('AO3', 'ORD', 'SYS002', 'AOS'),
('AO4', 'BCN', 'SYS003', 'AOS'),
('OI1', 'JFK', 'SYS004', 'OI'),
('OI2', 'JFK', 'SYS005', 'OI'),
('OI3', 'BCN', 'SYS006', 'OI'),
('OI4', 'BER', 'SYS007', 'OI');

INSERT INTO operational_interruption (event_id, flight_id, interruption_type) VALUES
('OI1', 'FL001', 'DELAY'),
('OI2', 'FL001', 'DELAY'),
('OI3', 'FL002', 'SAFETY'),
('OI4', 'FL004', 'DELAY');

INSERT INTO aircraft_out_of_service (event_id, service_type, duration, duration_unit) VALUES
('AO1', 'MAINTENANCE', 4, 'HOURS'),
('AO2', 'MAINTENANCE', 2, 'HOURS'),
('AO3', 'REVISION', 24, 'DAYS'),
('AO4', 'MAINTENANCE', 18, 'HOURS');

INSERT INTO Work_order (work_order_id, event_id, execution_place, execution_date, work_kind, duration_hours) VALUES
(1, 'AO1', 'Hangar 1a', '2024-10-25', 'Scheduled', 1),
(2, 'AO1', 'Hangar 1b', '2024-10-25', 'Scheduled', 1.5),
(3, 'AO3', 'Hangar 1', '2024-10-25', 'Scheduled', 30),
(4, 'AO3', 'Hangar 2', '2024-10-26', 'Scheduled', 64),
(5, 'AO3', 'Hangar 3', '2024-10-27', 'Unscheduled', 10),
(6, 'AO3', 'Hangar 2', '2024-10-28', 'Unscheduled', 4),
(7, 'AO4', 'Hangar 1c', '2024-10-28', 'Unscheduled', 4),
(8, 'OI1', 'Parking 32a', '2024-10-28', 'Unscheduled', 1),
(9, 'OI1', 'Parking 12b', '2024-10-28', 'Scheduled', 0.5);

INSERT INTO work_order_scheduled( work_order_id, forecasted_date, forecasted_manhours) VALUES
(1, '2024-10-25', 5),
(2, '2024-10-25', 3),
(3, '2024-10-26',120),
(4, '2024-10-29', 220),
(9, '2024-10-28', 5);

INSERT INTO work_order_unscheduled( work_order_id, reporter_class, reporter_id, due_date) VALUES
(5, 'Pilot', 'PL007', '2024-11-27'),
(6, 'Pilot', 'PL008', '2025-01-27'),
(7, 'Maintenance Personal', 'ME007', '2024-11-29'),
(8, 'Maintenance Personal', 'ME008', '2024-11-29');


INSERT INTO Flight_schedule (flight_id, actual_departure_time, actual_arrival_time, delay_code, num_passengers, num_cabin_crew, num_flight_crew, is_cancelled) VALUES
('FL001', '2024-12-01 08:15:00', '2024-12-01 16:10:00', NULL, 170, 5, 2, FALSE),
('FL002', '2024-12-01 17:30:00', '2024-12-02 01:20:00', 'D001', 150, 4, 2, FALSE),
('FL003', '2024-12-02 09:45:00', '2024-12-02 15:45:00', NULL, 360, 6, 3, FALSE),
('FL004', '2024-12-02 10:20:00', '2024-12-02 16:20:00', 'D002', 95, 3, 2, TRUE),
('FL005', '2024-12-03 13:05:00', '2024-12-03 14:40:00', NULL, 240, 5, 2, FALSE),
('FL006', '2024-12-03 15:15:00', '2024-12-03 16:45:00', NULL, 0, 4, 2, TRUE),
('FL007', '2024-12-04 10:10:00', '2024-12-04 13:05:00', NULL, 75, 2, 2, FALSE),
('FL008', '2024-12-04 14:10:00', '2024-12-04 17:15:00', NULL, 490, 8, 3, FALSE),
('FL009', '2024-12-05 08:40:00', '2024-12-05 12:10:00', NULL, 230, 5, 2, FALSE),
('FL010', '2024-12-05 13:10:00', '2024-12-05 16:40:00', 'D003', 370, 6, 2, FALSE);


INSERT INTO Aircraft_Inventory (aircraft_id, available) VALUES
(1, TRUE),
(2, TRUE),
(3, FALSE),
(4, TRUE),
(5, TRUE),
(6, FALSE),
(7, TRUE),
(8, TRUE),
(9, FALSE),
(10, TRUE);