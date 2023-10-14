CREATE TABLE professor_course (
	id_prof_course integer PRIMARY KEY,
	surname varchar(50) not null,
    name varchar(50) not null,
    patronymic varchar(50),
    factory varchar(100) not null
);
INSERT INTO professor_course ("id_prof_course", "surname", "name", "patronymic", "factory")
VALUES
    (1, 'Данов', 'Константин', 'Дмитриевич', 'ООО "Фирма АНКАД"'),
    (2, 'Максимов', 'Артем', 'Владимирович', 'Безработный'),
    (3, 'Маннаников', 'Даниил', null, 'Алкаш');

CREATE TABLE course (
	id_course integer PRIMARY KEY not null unique,
	title varchar(100) not null unique,
    price integer not null,
    id_prof_course integer not null REFERENCES professor_course(id_prof_course)
);
INSERT INTO course ("id_course", "title", "price", "id_prof_course")
VALUES
    (1, 'Веб-разработка', 100000, 1),
    (2, '3D-моделирование', 5000, 2),
    (3, 'АЛкоголизм', 500, 3);

CREATE TABLE course_professorID (
	id_course integer REFERENCES course(id_course),
	id_professor INTEGER REFERENCES professor(professor_id),
    PRIMARY KEY(id_course, id_professor)
);
INSERT INTO course_professorID ("id_course","id_professor")
VALUES
    (1, 81001),
    (3, 81001),
    (2, 81001),
    (2, 81002),
    (1, 81003),
    (3, 81004),
    (2, 81004),
    (1, 81004);