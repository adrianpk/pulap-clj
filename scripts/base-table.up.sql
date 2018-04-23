CREATE TABLE resource_plural_name (
id uuid NOT NULL,
name character varying(32) NOT NULL,
short_description character varying(128),
description text,
locale character varying(255),
"position" integer,
is_active boolean DEFAULT false NOT NULL,
is_logical_deleted boolean DEFAULT false NOT NULL,
created_by_id uuid,
updated_by_id uuid,
inserted_at timestamp without time zone NOT NULL,
updated_at timestamp without time zone NOT NULL
);

--;;

ALTER TABLE ONLY resource_plural_name
ADD CONSTRAINT resource_plural_name_pkey PRIMARY KEY (id);

--;;

CREATE INDEX resource_plural_name_created_by_id_index ON resource_plural_name USING btree (created_by_id);

--;;

CREATE INDEX resource_plural_name_updated_by_id_index ON resource_plural_name USING btree (updated_by_id);

--;;

ALTER TABLE ONLY resource_plural_name
ADD CONSTRAINT resource_plural_name_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES users(id);
