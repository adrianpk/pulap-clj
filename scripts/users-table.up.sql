CREATE TABLE public.users (
    id uuid NOT NULL,
    username character varying(32) NOT NULL,
    password_hash character varying(128) NOT NULL,
    email character varying(255) NOT NULL,
    given_name character varying(32),
    middle_names character varying(32),
    family_name character varying(64),
    card json,
    annotations jsonb,
    geolocation public.geometry(Point,4326),
    started_at timestamp with time zone,
    is_active boolean DEFAULT false NOT NULL,
    is_logical_deleted boolean DEFAULT false NOT NULL,
    created_by_id uuid,
    updated_by_id uuid,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);

--;;

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

--;;

CREATE UNIQUE INDEX users_username_email_index ON users USING btree (username, email);

--;;

ALTER TABLE ONLY users
    ADD CONSTRAINT users_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users(id);

--;;

ALTER TABLE ONLY users
    ADD CONSTRAINT users_updated_by_id_fkey FOREIGN KEY (updated_by_id) REFERENCES users(id);
