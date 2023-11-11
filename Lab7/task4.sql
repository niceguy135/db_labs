CREATE OR REPLACE PROCEDURE delete_Degree(Prof_ID integer)
LANGUAGE SQL
AS $$
    update professor set degree = NULL where professor_id = Prof_ID;
$$;