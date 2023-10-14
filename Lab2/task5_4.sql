select students_group_number as "Группа", count(*) as "Количество учащихся" from student
group by students_group_number
order by "Количество учащихся";