select surname, name ,patronymic, need_students.student_id, round(avg(mark), 2) as rounded_mark from
(
    select * from student where students_group_number like 'ИТД-3_'
) as need_students
inner join field_comprehension on field_comprehension.student_id = need_students.student_id
where mark > 3
group by (surname, name ,patronymic, need_students.student_id)
order by rounded_mark DESC
limit 10;

create table the_best_ten_ITD as
    select surname, name ,patronymic, need_students.student_id, round(avg(mark), 2) as rounded_mark from
    (
        select * from student where students_group_number like 'ИТД-3_'
    ) as need_students
    inner join field_comprehension on field_comprehension.student_id = need_students.student_id
    where mark > 3
    group by (surname, name ,patronymic, need_students.student_id)
    order by rounded_mark DESC
    limit 10;