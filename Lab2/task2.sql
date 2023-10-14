select surname as "Фамилия", name as "Имя", patronymic as "Отчество", students_group_number as "Группа" from student where
students_group_number ~* '.*-2.'
order by surname;