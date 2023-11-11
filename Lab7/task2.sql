CREATE OR REPLACE PROCEDURE change_Degree(Prof_change_ID integer, New_degree varchar(15))
LANGUAGE sql
AS $$
    update professor set degree = New_degree where professor_id = Prof_change_ID;
$$;