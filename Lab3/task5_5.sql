select 
    surname as "Фамилия",
    name as "Имя",
    patronymic as "Отчество",
    group_id as "Группа"
from debtor_students
except
select
    surname as "Фамилия",
    name as "Имя",
    patronymic as "Отчество",
    students_group_number as "Группа"
from student
order by "Фамилия";