-- -- если еще не модифицирована
-- add constraint unique_debt UNIQUE(surname, name, patronymic, group_id, debt_subject_id);

insert into debtor_students (surname, name, patronymic, group_id, debt_subject_id)
VALUES
('Горелов', 'Андрей', 'Никитич', 'ИВТ-44', '1fe356aa-5814-ed0d-40b1-4734e13978e9'),
('Горелов', 'Андрей', 'Никитич', 'ИВТ-44', '7ace7bee-0d70-5a1f-1113-2cd60d11dfa4'),
('Горелов', 'Андрей', 'Никитич', 'ИВТ-44', 'fdd39e6d-92ae-7e14-64af-0f023fde62d0'),
('Горелов', 'Андрей', 'Никитич', 'ИВТ-44', 'bd201d43-4932-4c1d-cd2e-f264ad9c27a5'),

('Фомина', 'Полина', 'Дмитриевна', 'ИВТ-44', '1fe356aa-5814-ed0d-40b1-4734e13978e9'),
('Фомина', 'Полина', 'Дмитриевна', 'ИВТ-44', '7ace7bee-0d70-5a1f-1113-2cd60d11dfa4'),
('Фомина', 'Полина', 'Дмитриевна', 'ИВТ-44', 'fdd39e6d-92ae-7e14-64af-0f023fde62d0'),
('Фомина', 'Полина', 'Дмитриевна', 'ИВТ-44', 'bd201d43-4932-4c1d-cd2e-f264ad9c27a5')
ON CONFLICT (surname, name, patronymic, group_id, debt_subject_id) DO NOTHING;

-- select student_id, student.surname, student.name, student.patronymic, debt_count from
-- (
--     select surname, name, patronymic, count(*) as debt_count
--     from debtor_students
--     group by surname, name, patronymic
-- ) as debts
-- join student on ((student.surname = debts.surname) AND (student.name = debts.name) AND (student.patronymic = debts.patronymic))
-- where debt_count >= 4;

delete from field_comprehension where student_id IN
(
    select student_id from
    (
        select surname, name, patronymic, count(*) as debt_count
        from debtor_students
        group by surname, name, patronymic
    ) as debts
    join student on ((student.surname = debts.surname) AND (student.name = debts.name) AND (student.patronymic = debts.patronymic))
    where debt_count >= 4
);


delete from student where student_id IN
(
    select student_id from
    (
        select surname, name, patronymic, count(*) as debt_count
        from debtor_students
        group by surname, name, patronymic
    ) as debts
    join student on ((student.surname = debts.surname) AND (student.name = debts.name) AND (student.patronymic = debts.patronymic))
    where debt_count >= 4
);

delete from debtor_students where surname IN
(
    select surname from
    (
        select surname, name, patronymic, count(*) as debt_count
        from debtor_students
        group by surname, name, patronymic
    ) as debts
    where debt_count >= 4
);