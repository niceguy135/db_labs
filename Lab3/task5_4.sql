select surname, name, patronymic from student
union
select surname, name, patronymic from professor
order by surname;