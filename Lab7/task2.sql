-- Не работает
CREATE OR REPLACE PROCEDURE change_Degree(Professor_ID bigint)
LANGUAGE SQL
AS $$
update professor set degree = 'д.к.н.' where professor_id = Professor_ID;
$$;