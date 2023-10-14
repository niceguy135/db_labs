select surname as "Фамилия", name as "Имя", patronymic as "Отчество", students_group_number as "Группа", birthday as "Днюха" from student where
birthday::text ~* '....-09-03';