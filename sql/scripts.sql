CREATE USER user_database_1 WITH PASSWORD 'password';
CREATE DATABASE database_1;
\c database_1;
CREATE SCHEMA schema_database_1;
GRANT SELECT ON ALL TABLES IN SCHEMA schema_database_1 TO user_database_1;

CREATE TABLE schema_database_1.users (
    user_id bigint UNIQUE NOT NULL PRIMARY KEY,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL
);
INSERT INTO schema_database_1.users (user_id, firstname, lastname) 
	VALUES
    (1, 'fabre', 'julien'),
    (2, 'louis', 'fabian'),
    (3, 'leblanc', 'stephane');

CREATE TABLE schema_database_1.notes (
    note_id bigint UNIQUE NOT NULL PRIMARY KEY,
    value bigint,
    user_id bigint NOT NULL,
    FOREIGN KEY (user_id) REFERENCES schema_database_1.users(user_id)
);
INSERT INTO schema_database_1.notes (note_id, value, user_id) 
	VALUES
    (1, 5, 1),
    (2, 3, 2),
    (3, 2, 3);