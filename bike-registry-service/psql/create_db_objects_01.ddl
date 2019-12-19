-- Create Database if Not Exists
-- Create Database manually or use createdb binary provided by Postgres

-- Create User bike-admin if Not Exists
DO
$do$
    BEGIN
        IF NOT EXISTS(
                SELECT
                FROM pg_catalog.pg_roles
                WHERE rolname = 'bikeadmin') THEN
            CREATE ROLE bikeadmin
                LOGIN PASSWORD 'bike123'
                NOSUPERUSER
                NOCREATEDB
                NOCREATEROLE
                REPLICATION
                VALID UNTIL 'infinity';
        END IF;
    END
$do$
LANGUAGE plpgsql;

-- Drop sequence if Exists
DROP SEQUENCE IF EXISTS public.bike_id_seq CASCADE;

-- Create sequence for bike id
CREATE SEQUENCE public.bike_id_seq;

ALTER SEQUENCE public.bike_id_seq
    OWNER TO bikeadmin;

DROP TABLE IF EXISTS public.bike CASCADE;

-- Create bike table
CREATE TABLE public.bike
(
    id integer NOT NULL DEFAULT nextval('bike_id_seq'::regclass),
    contact boolean NOT NULL,
    email character varying(255) COLLATE pg_catalog."default",
    model character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    phone character varying(255) COLLATE pg_catalog."default",
    purchase_date date,
    purchase_price numeric,
    serial_number character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT pg_bike_id PRIMARY KEY (id)
)
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

ALTER TABLE public.bike
    OWNER to bikeadmin;