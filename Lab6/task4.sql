-- Со стороны ученика
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from field_comprehension where student_id = 838389 and field = '7b268802-b50e-7c0b-b8f1-ba26d4292473';
BEGIN
--  student_id |                field                 | mark 
-- ------------+--------------------------------------+------
--      838389 | 7b268802-b50e-7c0b-b8f1-ba26d4292473 |    3
-- (1 row)

COMMIT;
-- COMMIT



kot=# BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from field_comprehension where student_id = 838389 and field = '7b268802-b50e-7c0b-b8f1-ba26d4292473';
BEGIN
--  student_id |                field                 | mark 
-- ------------+--------------------------------------+------
--      838389 | 7b268802-b50e-7c0b-b8f1-ba26d4292473 |    5
-- (1 row)

COMMIT;
-- COMMIT



-- Со стороны препода
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
update field_comprehension 
set mark = 5
where student_id = 838389 and field = '7b268802-b50e-7c0b-b8f1-ba26d4292473';
-- UPDATE 1
COMMIT;
-- COMMIT