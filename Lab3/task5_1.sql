select student_id, surname, email, password
from student
inner join users
on users.login = student.student_id;