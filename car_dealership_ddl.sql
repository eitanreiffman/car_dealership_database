-- CAR TABLE

CREATE TABLE car(
	car_id serial PRIMARY KEY,
	make varchar(20) NOT NULL,
	model varchar(20) NOT NULL,
	color varchar(20) NOT NULL,
	release_year integer NOT NULL
);

ALTER TABLE car
ALTER COLUMN release_year TYPE varchar(4);

SELECT *
FROM car;

-- CUSTOMER TABLE

CREATE TABLE customer(
	customer_id serial PRIMARY KEY,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	email varchar(50) NOT NULL
);

SELECT *
FROM customer;

-- SALESPERSON TABLE

CREATE TABLE salesperson(
	salesperson_id serial PRIMARY KEY,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	email varchar(50) NOT NULL,
	address varchar(50) NOT NULL
);

SELECT *
FROM salesperson;

-- INVOICE TABLE

CREATE TABLE invoice(
	invoice_id serial PRIMARY KEY,
	car_id integer NOT NULL,
	salesperson_id integer NOT NULL,
	customer_id integer NOT NULL,
	price NUMERIC(9,2) NOT null
);

ALTER TABLE invoice ADD CONSTRAINT fk_car_id
FOREIGN KEY (car_id) REFERENCES car(car_id);

ALTER TABLE invoice ADD CONSTRAINT fk_salesperson_id
FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id);

ALTER TABLE invoice ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE invoice
ADD COLUMN invoice_date timestamp;

SELECT *
FROM invoice;

-- MECHANIC TABLE

CREATE TABLE mechanic(
	mechanic_id serial PRIMARY KEY,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	email varchar(50) NOT NULL,
	address varchar(50) NOT NULL
);

SELECT *
FROM mechanic;

-- SERVICE TICKET TABLE

CREATE TABLE service_ticket(
	service_ticket_id serial PRIMARY KEY,
	car_id integer NOT NULL,
	customer_id integer NOT NULL,
	price NUMERIC(4,2) NOT null
	);

ALTER TABLE service_ticket ADD CONSTRAINT fk_car_id
FOREIGN KEY (car_id) REFERENCES car(car_id);

ALTER TABLE service_ticket ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE service_ticket
ADD COLUMN service_ticket_date timestamp;

SELECT *
FROM service_ticket;

-- SERVICE-MECHANIC TABLE (JOINED)

CREATE TABLE service_mechanic(
	service_ticket_id integer NOT NULL,
	mechanic_id integer NOT null
);

ALTER TABLE service_mechanic ADD CONSTRAINT fk_service_ticket_id
FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id);

ALTER TABLE service_mechanic ADD CONSTRAINT fk_mechanic_id
FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id);

SELECT *
FROM service_mechanic;

-- OUTGOING PAYMENT TABLE

CREATE TABLE outgoing_payment(
	outgoing_payment_id serial PRIMARY KEY,
	price NUMERIC(9,2) NOT NULL,
	car_id integer NOT null
);

ALTER TABLE outgoing_payment ADD CONSTRAINT fk_car_id
FOREIGN KEY (car_id) REFERENCES car(car_id);

-- OUTSIDE SELLER TABLE

CREATE TABLE outside_seller(
	outside_seller_id serial PRIMARY KEY,
	title varchar(50) NOT NULL,
);

ALTER TABLE outside_seller
ADD COLUMN email varchar(50) NOT NULL;

SELECT *
FROM outside_seller;

-- DEALERSHIP CAR HISTORY TABLE

CREATE TABLE dealership_car_history(
	dealership_car_history_id serial PRIMARY KEY,
	car_id integer NOT NULL,
	dealership_car_price NUMERIC(9,2) NOT NULL,
	sold boolean DEFAULT FALSE
);

ALTER TABLE dealership_car_history ADD CONSTRAINT fk_car_id
FOREIGN KEY (car_id) REFERENCES car(car_id);

SELECT *
FROM dealership_car_history;