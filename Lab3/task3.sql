select surname, name, patronymic, email
from student
inner join users
on users.login = student.student_id
where password ~* '^2002'
order by surname;