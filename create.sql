create schema rail;
commit;

set schema 'rail';

CREATE TABLE "user" (
	"id" serial NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "card" (
	"id" serial NOT NULL,
	CONSTRAINT card_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "reservation" (
	"time_to_live" TIME NOT NULL,
	"user_id" bigint NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT reservation_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "transaction" (
	"id" serial NOT NULL,
	"card_id" bigint,
	"status_id" bigint NOT NULL,
	"reservation_id" bigint NOT NULL,
	"is_cash" bool NOT NULL,
	CONSTRAINT transaction_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "passenger" (
	"id" serial NOT NULL,
	CONSTRAINT passenger_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "transaction_status" (
	"id" serial NOT NULL,
	CONSTRAINT transaction_status_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ticket" (
	"id" serial NOT NULL,
	"origin_station_id" bigint NOT NULL,
	"destination_station_id" bigint NOT NULL,
	"passenger_id" bigint NOT NULL,
	"reservation_id" bigint NOT NULL,
	"seat_id" bigint,
	"run_id" bigint NOT NULL,
	"price" numeric NOT NULL,
	"is_payment_done" bool NOT NULL,
	CONSTRAINT ticket_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "train" (
	"id" serial NOT NULL,
	"type_id" integer NOT NULL,
	CONSTRAINT train_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "car" (
	"id" serial NOT NULL,
	"type_id" bigint NOT NULL,
	"train_id" bigint NOT NULL,
	CONSTRAINT car_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "seat" (
	"id" serial NOT NULL,
	"car_id" bigint NOT NULL,
	"type_id" integer NOT NULL,
	CONSTRAINT seat_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "car_type" (
	"id" serial NOT NULL,
	CONSTRAINT car_type_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "route_station" (
	"route_id" bigint NOT NULL,
	"station_id" bigint NOT NULL,
	"station_index" integer NOT NULL,
	"time_arrival" TIME NOT NULL,
	"time_departure" TIME NOT NULL,
	CONSTRAINT route_station_pk PRIMARY KEY ("route_id","station_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "city" (
	"id" serial NOT NULL,
	CONSTRAINT city_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "station" (
	"id" serial NOT NULL,
	"city_id" integer NOT NULL,
	"price_zone_id" integer NOT NULL,
	CONSTRAINT station_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "price_zone" (
	"id" serial NOT NULL,
	CONSTRAINT price_zone_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "route_type" (
	"id" serial NOT NULL,
	CONSTRAINT route_type_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "run" (
	"id" serial NOT NULL,
	"train_id" serial NOT NULL,
	"route_id" serial NOT NULL,
	"base_rate" numeric NOT NULL,
	"date" DATE NOT NULL,
	CONSTRAINT run_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "train_type" (
	"id" serial NOT NULL,
	CONSTRAINT train_type_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "seat_type" (
	"id" serial NOT NULL,
	CONSTRAINT seat_type_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "route" (
	"id" serial NOT NULL,
	"type_id" integer NOT NULL,
	CONSTRAINT route_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "service" (
	"id" serial NOT NULL,
	CONSTRAINT service_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "ticket_service" (
	"ticket_id" bigint NOT NULL,
	"service_id" bigint NOT NULL,
	CONSTRAINT ticket_service_pk PRIMARY KEY ("ticket_id","service_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "reservation" ADD CONSTRAINT "reservation_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk0" FOREIGN KEY ("card_id") REFERENCES "card"("id");
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk1" FOREIGN KEY ("status_id") REFERENCES "transaction_status"("id");
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk2" FOREIGN KEY ("reservation_id") REFERENCES "reservation"("id");



ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("origin_station_id") REFERENCES "station"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk1" FOREIGN KEY ("destination_station_id") REFERENCES "station"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk2" FOREIGN KEY ("passenger_id") REFERENCES "passenger"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk3" FOREIGN KEY ("reservation_id") REFERENCES "reservation"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk4" FOREIGN KEY ("seat_id") REFERENCES "seat"("id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk5" FOREIGN KEY ("run_id") REFERENCES "run"("id");

ALTER TABLE "train" ADD CONSTRAINT "train_fk0" FOREIGN KEY ("type_id") REFERENCES "train_type"("id");

ALTER TABLE "car" ADD CONSTRAINT "car_fk0" FOREIGN KEY ("type_id") REFERENCES "car_type"("id");
ALTER TABLE "car" ADD CONSTRAINT "car_fk1" FOREIGN KEY ("train_id") REFERENCES "train"("id");

ALTER TABLE "seat" ADD CONSTRAINT "seat_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("id");
ALTER TABLE "seat" ADD CONSTRAINT "seat_fk1" FOREIGN KEY ("type_id") REFERENCES "seat_type"("id");


ALTER TABLE "route_station" ADD CONSTRAINT "route_station_fk0" FOREIGN KEY ("route_id") REFERENCES "route"("id");
ALTER TABLE "route_station" ADD CONSTRAINT "route_station_fk1" FOREIGN KEY ("station_id") REFERENCES "station"("id");


ALTER TABLE "station" ADD CONSTRAINT "station_fk0" FOREIGN KEY ("city_id") REFERENCES "city"("id");
ALTER TABLE "station" ADD CONSTRAINT "station_fk1" FOREIGN KEY ("price_zone_id") REFERENCES "price_zone"("id");



ALTER TABLE "run" ADD CONSTRAINT "run_fk0" FOREIGN KEY ("train_id") REFERENCES "train"("id");
ALTER TABLE "run" ADD CONSTRAINT "run_fk1" FOREIGN KEY ("route_id") REFERENCES "route"("id");



ALTER TABLE "route" ADD CONSTRAINT "route_fk0" FOREIGN KEY ("type_id") REFERENCES "route_type"("id");


ALTER TABLE "ticket_service" ADD CONSTRAINT "ticket_service_fk0" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("id");
ALTER TABLE "ticket_service" ADD CONSTRAINT "ticket_service_fk1" FOREIGN KEY ("service_id") REFERENCES "service"("id");
