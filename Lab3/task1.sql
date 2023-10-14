select professor.professor_id as "ID препода",
    surname as "Фамилия",
    name as "Имя",
    patronymic as "Отчество",
    wage_rate as "Ставка"
from professor
inner join employment
on employment.professor_id = professor.professor_id
where wage_rate = 0.25;