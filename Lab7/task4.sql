CREATE OR REPLACE PROCEDURE delete_Degree(Professor_ID integer)
LANGUAGE SQL
AS $$
update professor set degree = null where professor_id = Professor_ID;
$$;