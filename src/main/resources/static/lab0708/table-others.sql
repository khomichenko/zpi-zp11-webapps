CREATE TABLE IF NOT EXISTS public.cities (
    id bigint NOT NULL DEFAULT nextval('cities_id_seq'::regclass),
    name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    region character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cities_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.trains (
    id bigint NOT NULL DEFAULT nextval('trains_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT trains_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.schedules (
    id bigint NOT NULL DEFAULT nextval('schedules_id_seq'::regclass),
    city_from bigint NOT NULL,
    city_to bigint NOT NULL,
    time_departure timestamp without time zone NOT NULL,
    time_arrival timestamp without time zone NOT NULL,
    train_id bigint NOT NULL,
    distance integer NOT NULL,
    CONSTRAINT schedules_pkey PRIMARY KEY (id),
    CONSTRAINT city_from_fk FOREIGN KEY (city_from)
    REFERENCES public.cities (id) MATCH SIMPLE
                             ON UPDATE NO ACTION
                             ON DELETE NO ACTION
    NOT VALID,
    CONSTRAINT city_to_fk FOREIGN KEY (city_to)
    REFERENCES public.cities (id) MATCH SIMPLE
                             ON UPDATE NO ACTION
                             ON DELETE NO ACTION
    NOT VALID,
    CONSTRAINT train_id_fk FOREIGN KEY (train_id)
    REFERENCES public.trains (id) MATCH SIMPLE
                             ON UPDATE NO ACTION
                             ON DELETE NO ACTION
    NOT VALID
)