select students_group_number as "Группа", count(*) as "Количество учащихся" from student
where students_group_number like 'ИВТ-__'
group by students_group_number
order by students_group_number;