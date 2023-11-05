CREATE VIEW incomplete_bid AS
    select professor.professor_id as "ID препода",
        surname as "Фамилия",
        name as "Имя",
        patronymic as "Отчество",
        wage_rate as "Ставка"
    from professor
    inner join employment
    on employment.professor_id = professor.professor_id
    where wage_rate < 1;


CREATE VIEW bdays_on_this_mounth AS
    select surname as "Фамилия", name as "Имя", patronymic as "Отчество", students_group_number as "Группа", birthday as "Днюха" 
    from student 
    where birthday::text ~* '....-09-..';