CREATE OR REPLACE FUNCTION add_to_debtor() RETURNS trigger AS $emp_stamp$
    declare
        student_rec record;
    BEGIN
        IF NEW.mark = 2 THEN
            SELECT surname, name, patronymic, students_group_number
            into student_rec
            from student
            where student_id = NEW.student_id;

            INSERT INTO debtor_students (surname, name, patronymic, group_id, debt_subject_id)
            VALUES
            (student_rec.surname, student_rec.name, student_rec.patronymic, student_rec.students_group_number, NEW.field);
        END IF;
        RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER add_to_debtor_trigger
  AFTER UPDATE OF mark
  ON field_comprehension
  FOR ROW
  EXECUTE FUNCTION add_to_debtor();

------------------------------------------------------------------------------------------------

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