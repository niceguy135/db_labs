select 
    student.surname as "Фамилия",
    student.name as "Имя",
    student.patronymic as "Отчество",
    students_group_number as "Группа",
    debt_subject_id as "Долговая дисциплина"
from student
left outer join debtor_students
on student.surname = debtor_students.surname
and student.name = debtor_students.name
and student.patronymic = debtor_students.patronymic
order by student.surname;