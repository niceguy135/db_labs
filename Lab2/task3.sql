select count(*) as "Количество учеников, которые не А" from student where
surname ~* '^[^а]';