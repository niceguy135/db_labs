select students_group_number, count(*)
from (
    select students_group_number, surname, name, patronymic, email
    from student
    inner join users
    on users.login = student.student_id
    where password ~* '^2002'
) as base
group by students_group_number;