INSERT INTO students_group (students_group_number, enrolment_status, structural_unit_number) 
VALUES ('ИВТ-44', 'Очная', 1)
ON CONFLICT (students_group_number) DO NOTHING;

INSERT INTO student (student_id, surname, name, patronymic, students_group_number, birthday, email)
VALUES
(700000, 'Матвеева', 'Екатерина', 'Андреевна', 'ИВТ-44', '2004-02-14', 'qle1f@miet.ru'),
(700001, 'Борисов', 'Даниил', 'Тимурович', 'ИВТ-44', '2004-06-08', '_ajthp@miet.ru'),
(700002, 'Румянцева', 'Милана', 'Михайловна', 'ИВТ-44', '2004-09-22', '2de1@miet.ru'),
(700003, 'Серебрякова', 'Алиса', 'Серафимовна', 'ИВТ-44', '2004-06-20', 'o1fuws-vjc@miet.ru'),
(700004, 'Титова', 'Варвара', 'Мироновна', 'ИВТ-44', '2004-08-27', '81w5m._2kus@miet.ru'),
(700005, 'Максимов', 'Артем', 'Даунович', 'ИВТ-44', '2004-12-09', 'pqn8-ygz0@miet.ru'),
(700006, 'Фомина', 'Полина', 'Дмитриевна', 'ИВТ-44', '2004-05-01', 'pk_3i7@miet.ru'),
(700007, 'Павлов', 'Павел', 'Константинович', 'ИВТ-44', '2004-08-27', 'ohuj@miet.ru'),
(700008, 'Малышева', 'Виктория', 'Дамировна', 'ИВТ-44', '2004-02-09', 'bq5.@miet.ru'),
(700009, 'Тимофеева', 'Марьяна', 'Алексеевна', 'ИВТ-44', '2004-03-08', 'u9blno804@miet.ru'),
(700010, 'Спиридонова', 'Алиса', 'Михайловна', 'ИВТ-44', '2004-11-05', 'cp09@miet.ru'),
(700011, 'Мананников', 'Даниил', 'Бухалович', 'ИВТ-44', '2004-03-28', 'owulqedihpj@miet.ru'),
(700012, 'Гончаров', 'Даниил', 'Тимофеевич', 'ИВТ-44', '2004-11-15', 'vrbdho27@miet.ru'),
(700013, 'Елисеева', 'Екатерина', 'Ивановна', 'ИВТ-44', '2004-07-09', '9az-3@miet.ru'),
(700014, 'Губанова', 'Анна', 'Романовна', 'ИВТ-44', '2004-06-02', 'dgrabeqv@miet.ru'),
(700015, 'Прохоров', 'Никита', 'Егорович', 'ИВТ-44', '2004-05-22', 'tw57@miet.ru'),
(700016, 'Бочаров', 'Лев', 'Дмитриевич', 'ИВТ-44', '2004-07-11', 'nz12hpvcyr@miet.ru'),
(700017, 'Ткачев', 'Виктор', 'Савельевич', 'ИВТ-44', '2004-01-25', '.y4saj9okp@miet.ru'),
(700018, 'Тихонов', 'Кирилл', 'Дмитриевич', 'ИВТ-44', '2004-07-25', 'u79y0mz5xi4@miet.ru'),
(700019, 'Андрианова', 'Александра', 'Андреевна', 'ИВТ-44', '2004-11-30', '2_rqj@miet.ru'),
(700020, 'Зотова', 'Алёна', 'Константиновна', 'ИВТ-44', '2004-02-08', 'nmwrc5vpq@miet.ru'),
(700021, 'Данов', 'Константин', 'Богоподобнович', 'ИВТ-44', '2004-05-17', 'huvw0qr-@miet.ru'),
(700022, 'Морозова', 'Айлин', 'Николаевна', 'ИВТ-44', '2004-01-26', 'ocmteyp_s@miet.ru'),
(700023, 'Рябинина', 'Елизавета', 'Алиевна', 'ИВТ-44', '2004-10-23', '-e9w64@miet.ru'),
(700024, 'Карпов', 'Артём', 'Артёмович', 'ИВТ-44', '2004-08-19', 'y2hja0codi-@miet.ru')
ON CONFLICT (student_id) DO NOTHING;

INSERT INTO student_id (student_id)
VALUES
(700000),
(700001),
(700002),
(700003),
(700004),
(700005),
(700006),
(700007),
(700008),
(700009),
(700010),
(700011),
(700012),
(700013),
(700014),
(700015),
(700016),
(700017),
(700018),
(700019),
(700020),
(700021),
(700022),
(700023),
(700024)
ON CONFLICT (student_id) DO NOTHING;

INSERT INTO field_comprehension (student_id, field, mark)
(
    SELECT student.student_id, field_comprehension.field, 5 as mark
    FROM student, field_comprehension
    WHERE field_comprehension.student_id = 866614 AND student.students_group_number like 'ИВТ-44'
)
ON CONFLICT (student_id, field) DO NOTHING;

