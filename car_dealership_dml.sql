-- To kick things off, we're going to add cars, customers, and staff members to the database
-- After that, we'll show how they fit in the context of the dealership

-- STEP ONE:

-- Adding cars to the CAR TABLE
-- Note: These are not just cars that are owned by the dealership
-- The CAR TABLE keeps track of all cars, inluding those that have only come in for repair

CREATE OR REPLACE PROCEDURE add_car(
	c_make VARCHAR(20),
	c_model VARCHAR(20),
	c_color VARCHAR(20),
	c_release_year varchar(4)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car(
	make,
	model,
	color,
	release_year
) VALUES (
	c_make,
	c_model,
	c_color,
	c_release_year
);
END;
$$;

CALL add_car('Ford', 'Fusion', 'White', 2008);
CALL add_car('Ford', 'Focus', 'Silver', 2005);
CALL add_car('Toyota', '4Runner', 'Charcoal', 2004);
CALL add_car('Honda', 'Accord', 'Black', 2009);
CALL add_car('Hyundai', 'Elantra', 'Blue', 2013);
CALL add_car('Nissan', 'Altima', 'White', 2018);
CALL add_car('BMW', 'Z3', 'Light Blue', 2016);
CALL add_car('Tesla', 'Model 3', 'Silver', 2020);
CALL add_car('Cadillac', 'STS', 'Beige', 2019);
CALL add_car('Jeep', 'Grand Cherokee', 'White', 2022);
CALL add_car('KIA', 'Sportage', 'Black', 2019);
CALL add_car('BMW', '5 Series', 'Black', 2012);
CALL add_car('Tesla', 'Model Y', 'Charcoal', 2021);
CALL add_car('Cadillac', 'CTS', 'Black', 2010);
CALL add_car('Honda', 'Rav4', 'Green', 2020);
CALL add_car('Jeep', 'Wrangler', 'Dark Blue', 2022);
CALL add_car('Batmobile', 'Vintage', 'Black', 1956);
CALL add_car('DeLorean', 'DMC-12', 'Silver', 1985);
CALL add_car('Land Rover', 'Range Rover', 'Green', 2020);
CALL add_car('Honda', 'Civic', 'Red', 2021);
CALL add_car('Toyota', 'Corolla', 'Blue', 2022);
CALL add_car('Toyota', 'Sienna', 'White', 2020);
CALL add_car('Hyundai', 'Palisade', 'Silver', 2017);


SELECT *
FROM car;

--car_id|make    |model         |color     |release_year|
--------+--------+--------------+----------+------------+
--     5|Ford    |Fusion        |White     |2008        |
--     6|Ford    |Focus         |Silver    |2005        |
--     7|Toyota  |4Runner       |Charcoal  |2004        |
--     8|Honda   |Accord        |Black     |2009        |
--     9|Hyundai |Elantra       |Blue      |2013        |
--    10|Nissan  |Altima        |White     |2018        |
--    11|BMW     |Z3            |Light Blue|2016        |
--    12|Tesla   |Model 3       |Silver    |2020        |
--    13|Cadillac|STS           |Beige     |2019        |
--    14|Jeep    |Grand Cherokee|White     |2022        |
--    15|KIA     |Sportage      |Black     |2019        |
--    16|BMW     |5 Series      |Black     |2012        |
--    17|Tesla    |Model Y       |Charcoal  |2021        |
--    18|Cadillac |CTS           |Black     |2010        |
--    19|Honda    |Rav4          |Green     |2020        |
--    20|Jeep     |Wrangler      |Dark Blue |2022        |
--    21|Batmobile|Vintage       |Black     |1956        |
--    22|DeLorean |DMC-12        |Silver    |1985        |
--    23|Land Rover|Range Rover   |Green     |2020        |
--    24|Honda     |Civic         |Red       |2021        |
--    25|Toyota    |Corolla       |Blue      |2022        |
--    26|Toyota    |Sienna        |White     |2020        |
--    27|Hyundai   |Palisade      |Silver    |2017        |

-- Now that we've added cars to the CAR TABLE,
-- let's determine how exactly these cars came into contact with the dealership.
-- We'll do this by creating new procedures that'll add context to each of the cars in our CAR TABLE

====================================================================================

-- STEP TWO:

-- Adding customers to the CUSTOMER TABLE
-- Again, these can be customers that either bought a car, or brought one in for repair (or both)

CREATE OR REPLACE PROCEDURE add_customer(
	c_first varchar(30),
	c_last varchar(30),
	c_email varchar(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(
		first_name,
		last_name,
		email
	) VALUES (
		c_first,
		c_last,
		c_email
);
END;
$$;

CALL add_customer('Robbie', 'Jackson', 'anchor@smith.com');
CALL add_customer('Shaggy', 'Johnson', 'mystery@machine.com');
CALL add_customer('Dexter', 'Smart', 'sistersuck@gmail.com');
CALL add_customer('Ed', 'Smith', 'thesmartested@aol.com');
CALL add_customer('Roger', 'Daltrey', 'frontman@who.com');
CALL add_customer('Pete', 'Townshend', 'guitarist@who.com');
CALL add_customer('Paul', 'McCartney', 'fixing@ahole.com');
CALL add_customer('John', 'Lennon', 'nothing@isreal.com');
CALL add_customer('Ringo', 'Starr', 'drummerlife@aol.com');
CALL add_customer('George', 'Harrison', 'guitarweepin@underrated.com');
CALL add_customer('Ray', 'Davies', 'wellrespected@gmail.com');
CALL add_customer('Dave', 'Davies', 'overshadowed@aol.com');
CALL add_customer('Ronald', 'McDonald', 'imlovin@it.com');
CALL add_customer('Charlie', 'Kelly', 'kingoftherats@cantread.com');
CALL add_customer('Frank', 'Reynolds', 'roastthisbone@gettinweird.com');
CALL add_customer('Bruce', 'Wayne', 'thedarkest@knight.com');
CALL add_customer('Doc', 'Brown', 'wedontneedroads@science.com');
CALL add_customer('Dennis', 'Reynolds', 'finishercar@goldengod.com');
CALL add_customer('Michael', 'Scott', 'somehowimanage@dunder.com');
CALL add_customer('Stanley', 'Hudson', 'pretzelday@allday.com');

SELECT *
FROM customer;

--customer_id|first_name|last_name|email                        |
-------------+----------+---------+-----------------------------+
--          1|Robbie    |Jackson  |anchor@smith.com             |
--          2|Shaggy    |Johnson  |mystery@machine.com          |
--          3|Dexter    |Smart    |sistersuck@gmail.com         |
--          4|Ed        |Smith    |thesmartested@aol.com        |
--          5|Roger     |Daltrey  |frontman@who.com             |
--          6|Pete      |Townshend|guitarist@who.com            |
--          7|Paul      |McCartney|fixing@ahole.com             |
--          8|John      |Lennon   |nothing@isreal.com           |
--          9|Ringo     |Starr    |drummerlife@aol.com          |
--         10|George    |Harrison |guitarweepin@underrated.com  |
--         11|Ray       |Davies   |wellrespected@gmail.com      |
--         12|Dave      |Davies   |overshadowed@aol.com         |
--         13|Ronald    |McDonald |imlovin@it.com               |
--         14|Charlie   |Kelly    |kingoftherats@cantread.com   |
--         15|Frank     |Reynolds |roastthisbone@gettinweird.com|
--         16|Bruce     |Wayne    |thedarkest@knight.com        |
--         17|Doc       |Brown    |wedontneedroads@science.com  |
--         18|Dennis    |Reynolds |finishercar@goldengod.com    |
--         19|Michael   |Scott    |somehowimanage@dunder.com    |
--         20|Stanley   |Hudson   |pretzelday@allday.com        |


====================================================================================

-- STEP THREE:

-- We're also going to add staff to the dealership: Mechanics and Salespeople

CREATE OR REPLACE PROCEDURE add_mechanic(
	m_first varchar(30),
	m_last varchar(30),
	m_email varchar(50),
	m_address varchar(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(
		first_name,
		last_name,
		email,
		address
	) VALUES (
		m_first,
		m_last,
		m_email,
		m_address
);
END;
$$;

CREATE OR REPLACE PROCEDURE add_salesperson(
	s_first varchar(30),
	s_last varchar(30),
	s_email varchar(50),
	s_address varchar(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(
		first_name,
		last_name,
		email,
		address
	) VALUES (
		s_first,
		s_last,
		s_email,
		s_address
);
END;
$$;

CALL add_mechanic('Doctor', 'Robert', 'thecardoctor@mechaniclyfe.com', '123 Real Street');
CALL add_mechanic('Marisa', 'Tomei', 'familyofmechanics@huntingisbad.com', '321 Fake Street');
CALL add_mechanic('Harry', 'Potter', 'usingmagic@tofixcars.com', '24 Godrics Hollow');
CALL add_mechanic('Ron', 'Weasley', 'alwaysnumbertwo@lavender.com', '112 Burrow Blvd');

CALL add_salesperson('Fred', 'Weasley', 'oldertwin@abc.com', '112 Burrow Blvd');
CALL add_salesperson('George', 'Weasley', 'secondtwin@abc.com', '112 Burrow Blvd');
CALL add_salesperson('Luna', 'Lovegood', 'iloveweirdcars@gmail.com', '25 Ottery St Catchpole');
CALL add_salesperson('Alastor', 'Moody', 'constant@vigilance.com', '99 Briefcase Ave');

SELECT *
FROM mechanic;

--mechanic_id|first_name|last_name|email                             |address          |
-------------+----------+---------+----------------------------------+-----------------+
--          1|Doctor    |Robert   |thecardoctor@mechaniclyfe.com     |123 Real Street  |
--          2|Marisa    |Tomei    |familyofmechanics@huntingisbad.com|321 Fake Street  |
--          3|Harry     |Potter   |usingmagic@tofixcars.com          |24 Godrics Hollow|
--          4|Ron       |Weasley  |alwaysnumbertwo@lavender.com      |112 Burrow Blvd  |

SELECT *
FROM salesperson;

--salesperson_id|first_name|last_name|email                   |address               |
----------------+----------+---------+------------------------+----------------------+
--             1|Fred      |Weasley  |oldertwin@abc.com       |112 Burrow Blvd       |
--             2|George    |Weasley  |secondtwin@abc.com      |112 Burrow Blvd       |
--             3|Luna      |Lovegood |iloveweirdcars@gmail.com|25 Ottery St Catchpole|
--             4|Alastor   |Moody    |constant@vigilance.com  |99 Briefcase Ave      |

====================================================================================

-- STEP FOUR:

-- We've added cars, customers, mechanics, and salespeople
-- Now we'll finally insert them into the context of the dealership


-- We're now going to add people to the OUTSIDE SELLER TABLE
-- The OUTSIDE SELLER TABLE isn't just people selling used cars.
-- It's also other car companies, or car dealerships, selling new cars to our dealership

CREATE OR REPLACE PROCEDURE add_outside_seller(
	s_title varchar(50),
	s_email varchar(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO outside_seller (
	title,
	email
	) VALUES (
	s_title,
	s_email
);
END;
$$;

CALL add_outside_seller ('WE SELL USED CARS', 'greatdeals@usedcars.com');
CALL add_outside_seller ('Cars From Charlie', 'charliebucket@cars.com');
CALL add_outside_seller ('Ricks Rippin Rides', 'rickgrimes@rippinrides.com');
CALL add_outside_seller ('Jonathan Thomas Vehicles Inc.', 'jonathanthomas@gmail.com');
CALL add_outside_seller ('Jimmy McGill', 'bettercallsaul@aol.com');

SELECT *
FROM outside_seller;

--outside_seller_id|title                        |email                     |
-------------------+-----------------------------+--------------------------+
--                1|WE SELL USED CARS            |greatdeals@usedcars.com   |
--                2|Cars From Charlie            |charliebucket@cars.com    |
--                3|Ricks Rippin Rides           |rickgrimes@rippinrides.com|
--                4|Jonathan Thomas Vehicles Inc.|jonathanthomas@gmail.com  |
--                5|Jimmy McGill                 |bettercallsaul@aol.com    |

-- To correspond with our OUTSIDE SELLERS:
-- The following procedure is for OUTGOING PAYMENTS
-- Whenever the dealership BUYS a car from an outside seller, they will document it here:

CREATE OR REPLACE PROCEDURE add_outgoing_payment(
	p_price NUMERIC(9,2),
	p_car_id integer,
	p_outside_seller_id integer
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO outgoing_payment(
	price,
	car_id,
	outside_seller_id
	) VALUES (
	p_price,
	p_car_id,
	p_outside_seller_id
);
END;
$$;

CALL add_outgoing_payment (53000, 7, 2);
CALL add_outgoing_payment (63000, 8, 2);
CALL add_outgoing_payment (23000, 9, 1);
CALL add_outgoing_payment (26400, 10, 1);
CALL add_outgoing_payment (99400, 11, 3);
CALL add_outgoing_payment (67500, 12, 3);
CALL add_outgoing_payment (77040, 13, 4);
CALL add_outgoing_payment (57770, 14, 4);
CALL add_outgoing_payment (39200, 15, 5);

SELECT *
FROM outgoing_payment;

--Provided is the price OUR dealership paid for the car, and the ID of the company (or person) our dealership bought it from
--
--outgoing_payment_id|price   |car_id|outside_seller_id|
---------------------+--------+------+-----------------+
--                 10|53000.00|     7|                2|
--                 11|63000.00|     8|                2|
--                 12|23000.00|     9|                1|
--                 13|26400.00|    10|                1|
--                 14|99400.00|    11|                3|
--                 15|67500.00|    12|                3|
--                 16|77040.00|    13|                4|
--                 17|57770.00|    14|                4|
--                 18|39200.00|    15|                5|

====================================================================================

-- STEP FIVE:

-- We input data into the INVOICE TABLE
-- This table shows which cars were bought from the dealership

CREATE OR REPLACE PROCEDURE add_invoice(
	i_car_id integer,
	i_salesperson_id integer,
	i_customer_id integer,
	i_price NUMERIC(9,2),
	i_invoice_date in timestamp
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO invoice (
	car_id,
	salesperson_id,
	customer_id,
	price,
	invoice_date
	) VALUES (
	i_car_id,
	i_salesperson_id,
	i_customer_id,
	i_price,
	i_invoice_date
);
END;
$$;

CALL add_invoice (7, 1, 1, 63000, timestamp '2-24-2022');
CALL add_invoice (9, 2, 12, 33000, timestamp '3-11-2022');
CALL add_invoice (10, 1, 3, 36400, timestamp '4-2-2022');
CALL add_invoice (12, 4, 2, 77500, timestamp '5-30-2022');
CALL add_invoice (13, 2, 4, 87040, timestamp '6-13-2022');
CALL add_invoice (15, 3, 6, 49200, timestamp '7-1-2022');

SELECT *
FROM invoice;

--invoice_id|car_id|salesperson_id|customer_id|price   |invoice_date           |
------------+------+--------------+-----------+--------+-----------------------+
--         3|     7|             1|          1|63000.00|2022-02-24 
--         4|     9|             2|         12|33000.00|2022-03-11 
--         5|    10|             1|          3|36400.00|2022-04-02 
--         6|    12|             4|          2|77500.00|2022-05-30 
--         7|    13|             2|          4|87040.00|2022-06-13 
--         8|    15|             3|          6|49200.00|2022-07-01 

====================================================================================

-- The DEALERSHIP CAR HISTORY TABLE is about preserving the history of every car
-- the dealership has ever bought and sold. Whether a car is sold or not, it stays on file in this table

CREATE OR REPLACE PROCEDURE add_dealership_car(
	d_car_id integer,
	d_dealership_car_price NUMERIC(9,2), -- this is the NEW price AFTER the dealership acquired the car
	d_sold boolean DEFAULT false
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO dealership_car_history (
	car_id,
	dealership_car_price,
	sold
	) VALUES (
	d_car_id,
	d_dealership_car_price,
	d_sold
);
END;
$$;

-- Our default Boolean value is set to false, which means the car has NOT been sold
-- So every time a car is sold, it stays in the table but is set to TRUE

CALL add_dealership_car (7, 63000, TRUE);
CALL add_dealership_car (8, 73000);
CALL add_dealership_car (9, 33000, TRUE);
CALL add_dealership_car (10, 36400, TRUE);
CALL add_dealership_car (11, 109400);
CALL add_dealership_car (12, 77500, TRUE);
CALL add_dealership_car (13, 88040, TRUE);
CALL add_dealership_car (14, 67770);
CALL add_dealership_car (15, 49200, TRUE);

SELECT *
FROM dealership_car_history;

--dealership_car_history_id|car_id|dealership_car_price|sold |
---------------------------+------+--------------------+-----+
--                        1|     7|            63000.00|true |
--                        2|     8|            73000.00|false|
--                        3|     9|            33000.00|true |
--                        4|    10|            36400.00|true |
--                        5|    11|           109400.00|false|
--                        6|    12|            77500.00|true |
--                        7|    13|            88040.00|true |
--                        8|    14|            67770.00|false|
--                        9|    15|            49200.00|true |

====================================================================================

-- STEP SIX

-- Finally, we address the SERVICE TICKET TABLE and the SERVICE MECHANIC TABLE
-- Every car that's in the CAR TABLE that's NOT in the DEALERSHIP CAR HISTORY TABLE
-- MUST have been brought in for repairs - otherwise it wouldn't be part of the system
-- The same logic applies to the customers in the CUSTOMER TABLE

-- The service tickets show which cars have been brought in for service jobs

CREATE OR REPLACE PROCEDURE add_service_ticket(
	s_car_id integer,
	s_customer_id integer,
	s_price NUMERIC(4,2),
	s_service_ticket_date timestamp
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_ticket (
	car_id,
	customer_id,
	price,
	service_ticket_date
	) VALUES (
	s_car_id,
	s_customer_id,
	s_price,
	s_service_ticket_date
);
END;
$$;

CALL add_service_ticket (5, 5, 19.99, timestamp '4-23-2022');
CALL add_service_ticket (6, 7, 19.99, timestamp '4-27-2022');
CALL add_service_ticket (10, 3, 34.99, timestamp '5-11-2022');
CALL add_service_ticket (16, 9, 34.99, timestamp '5-14-2022');
CALL add_service_ticket (17, 10, 19.99, timestamp '5-30-2022');
CALL add_service_ticket (18, 11, 34.99, timestamp '6-14-2022');
CALL add_service_ticket (19, 13, 34.99, timestamp '6-23-2022');
CALL add_service_ticket (20, 14, 19.99, timestamp '7-4-2022');
CALL add_service_ticket (21, 16, 19.99, timestamp '7-23-2022');
CALL add_service_ticket (22, 17, 34.99, timestamp '8-2-2022');
CALL add_service_ticket (24, 15, 34.99, timestamp '8-8-2022');
CALL add_service_ticket (23, 18, 19.99, timestamp '8-13-2022');
CALL add_service_ticket (25, 19, 19.99, timestamp '9-12-2022');
CALL add_service_ticket (26, 20, 34.99, timestamp '9-21-2022');
CALL add_service_ticket (27, 8, 19.99, timestamp '10-28-2022');

SELECT *
FROM service_ticket;

--service_ticket_id|car_id|customer_id|price|service_ticket_date    |
-------------------+------+-----------+-----+-----------------------+
--                1|     5|          5|19.99|2022-04-23 
--                2|     6|          7|19.99|2022-04-27 
--                3|    10|          3|34.99|2022-05-11 
--                4|    16|          9|34.99|2022-05-14 
--                5|    17|         10|19.99|2022-05-30 
--                6|    18|         11|34.99|2022-06-14 
--                7|    19|         13|34.99|2022-06-23 
--                8|    20|         14|19.99|2022-07-04 
--                9|    21|         16|19.99|2022-07-23 
--               10|    22|         17|34.99|2022-08-02 
--               11|    24|         15|34.99|2022-08-08 
--               12|    23|         18|19.99|2022-08-13 
--               13|    25|         19|19.99|2022-09-12 
--               14|    26|         20|34.99|2022-09-21 
--               15|    27|          8|19.99|2022-10-28 


====================================================================================


-- Since the MECHANIC TABLE and the SERVICE TICKET TABLE have a many-to-many relationship
-- we're going to create a joined table called SERVICE MECHANIC that records which mechanics worked on which service jobs

CREATE OR REPLACE PROCEDURE add_service_mechanic(
	s_service_ticket_id integer,
	s_mechanic_id integer
)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO service_mechanic (
	service_ticket_id,
	mechanic_id
	) VALUES (
	s_service_ticket_id,
	s_mechanic_id
);
END;
$$;

CALL add_service_mechanic(1, 1);
CALL add_service_mechanic(1, 2);
CALL add_service_mechanic(2, 3);
CALL add_service_mechanic(2, 4);
CALL add_service_mechanic(2, 1);
CALL add_service_mechanic(3, 2);
CALL add_service_mechanic(3, 3);
CALL add_service_mechanic(3, 4);
CALL add_service_mechanic(4, 3);
CALL add_service_mechanic(4, 4);
CALL add_service_mechanic(5, 1);
CALL add_service_mechanic(5, 3);
CALL add_service_mechanic(6, 2);
CALL add_service_mechanic(7, 3);
CALL add_service_mechanic(8, 4);
CALL add_service_mechanic(8, 1);
CALL add_service_mechanic(9, 1);
CALL add_service_mechanic(10, 2);
CALL add_service_mechanic(11, 4);
CALL add_service_mechanic(12, 3);
CALL add_service_mechanic(13, 2);
CALL add_service_mechanic(14, 1);
CALL add_service_mechanic(14, 3);
CALL add_service_mechanic(15, 2);

SELECT *
FROM service_mechanic;