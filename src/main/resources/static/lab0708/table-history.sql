CREATE TABLE IF NOT EXISTS public.history (
    id bigint NOT NULL DEFAULT nextval('history_id_seq'::regclass),
    created timestamp without time zone NOT NULL,
    expression character varying(255) COLLATE pg_catalog."default",
    result character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT history_pkey PRIMARY KEY (id)
)