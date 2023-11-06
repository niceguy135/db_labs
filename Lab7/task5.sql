-- CREATE OR REPLACE FUNCTION control_student_age()
--   RETURNS TRIGGER 
--   LANGUAGE PLPGSQL
--   AS
-- $$
-- BEGIN
--     IF datediff(yy, NEW.birthday, getdate()) >= 100 THEN
--         RAISE NOTICE 'Студент слишком старый для всего этого дерьма...';
--     END IF;
--     RETURN NEW;
-- END;
-- $$

CREATE OR REPLACE FUNCTION control_student_age() RETURNS trigger AS $emp_stamp$
    BEGIN
        IF DATE_PART('year', current_date) - DATE_PART('year', NEW.birthday)  >= 100 THEN
        RAISE EXCEPTION 'Студент слишком старый для всего этого дерьма...';
        END IF;
        RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER control_student_age_trigger
  BEFORE INSERT
  ON student
  FOR EACH ROW
  EXECUTE FUNCTION control_student_age();