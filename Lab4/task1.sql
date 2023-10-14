CREATE TABLE professor_field (
	field_id UUID not null REFERENCES field(field_id),
	professor_id INTEGER not null REFERENCES professor(professor_id),
    PRIMARY KEY(field_id, professor_id)
);