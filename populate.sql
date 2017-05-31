-- USER
INSERT INTO rail.user (id) values (1);
INSERT INTO rail.user (id) values (2);
INSERT INTO rail.user (id) values (3);


-- PASSENGER
INSERT INTO rail.passenger (id) values (1);
INSERT INTO rail.passenger (id) values (2);
INSERT INTO rail.passenger (id) values (3);


-- RESERVATION
INSERT INTO rail.reservation (user_id, time_to_live) values (1, now());
INSERT INTO rail.reservation (user_id, time_to_live) values (2, now());
INSERT INTO rail.reservation (user_id, time_to_live) values (2, now());
INSERT INTO rail.reservation (user_id, time_to_live) values (3, now());
INSERT INTO rail.reservation (user_id, time_to_live) values (3, now());
INSERT INTO rail.reservation (user_id, time_to_live) values (3, now());


-- CITY
INSERT INTO rail.city (id) values (1);
INSERT INTO rail.city (id) values (2);
INSERT INTO rail.city (id) values (3);
INSERT INTO rail.city (id) values (4);
INSERT INTO rail.city (id) values (5);
INSERT INTO rail.city (id) values (6);
INSERT INTO rail.city (id) values (7);


-- PRICE_ZONE
INSERT INTO rail.price_zone (id) values (1);
INSERT INTO rail.price_zone (id) values (2);
INSERT INTO rail.price_zone (id) values (3);
INSERT INTO rail.price_zone (id) values (4);
INSERT INTO rail.price_zone (id) values (5);
INSERT INTO rail.price_zone (id) values (6);
INSERT INTO rail.price_zone (id) values (7);


-- ROUTE_TYPE
INSERT INTO rail.route_type (id) values (1);
INSERT INTO rail.route_type (id) values (2);
INSERT INTO rail.route_type (id) values (3);


-- ROUTE
INSERT INTO rail.route (type_id) values (1);
INSERT INTO rail.route (type_id) values (2);

-- STATION
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);
INSERT INTO rail.station (city_id, price_zone_id) values (1, 1);



-- ROUTE_STATION

-- ROUTE 1
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 1, 1, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 2, 2, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 3, 3, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 4, 4, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 5, 5, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(1, 7, 6, now(), now());


 -- ROUTE 2
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(2, 1, 1, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(2, 2, 2, now(), now());
INSERT INTO rail.route_station
(route_id, station_id, station_index, time_arrival, time_departure)
VALUES
(2, 3, 3, now(), now());


-- SEAT_TYPE
INSERT INTO rail.seat_type (id) values (1);

-- TRAIN_TYPE
INSERT INTO rail.train_type (id) values (1);

-- CAR_TYPE
INSERT INTO rail.car_type (id) values (1);


-- TRAIN
INSERT INTO rail.train (id, type_id) values (1, 1);

-- CAR
INSERT INTO rail.car (id, train_id, type_id) values (1, 1, 1);

-- SEAT
INSERT INTO rail.seat (id, car_id, type_id) values (1, 1, 1);

-- RUN
INSERT INTO rail.run (id, train_id, route_id, base_rate, date)
VALUES (1, 1, 1, 100, DATE('2017-05-31'));

INSERT INTO rail.run (id, train_id, route_id, base_rate, date)
VALUES (2, 1, 1, 100, DATE('2017-06-01'));

INSERT INTO rail.run (id, train_id, route_id, base_rate, date)
VALUES (3, 1, 2, 150, DATE('2017-06-01'));
