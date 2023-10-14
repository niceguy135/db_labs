ALTER TABLE
    students_group ADD COLUMN student_master_id INTEGER,
    ADD CONSTRAINT group_equal FOREIGN KEY(
        student_master_id
    ) REFERENCES student(
        student_id
    );