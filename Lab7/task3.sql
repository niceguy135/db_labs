CREATE TYPE Student AS(
student_id integer,
surname varchar(30),
name varchar(30),
patronymic varchar(30),
students_group_number varchar(30),
BDay date,
email varchar(50)
);


CREATE OR REPLACE FUNCTION get_group(Group_name varchar(10)) RETURNS setof Student
LANGUAGE SQL
AS $$
SELECT *
FROM student
WHERE students_group_number = Group_name
$$;