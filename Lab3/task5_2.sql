select
    field.field_name as "Предмет ужаса",
    structural_unit.full_title as "Логово придурков",
    CONCAT(professor.surname, ' ', professor.name, ' ', professor.patronymic) as "ФИО злодея" 
from field
inner join structural_unit 
on structural_unit.structural_unit_id = field.structural_unit_id
inner join professor
on professor.professor_id = field.professor_id
order by "Предмет ужаса";