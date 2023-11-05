explain analyze select * from field_comprehension order by student_id;
--                                                                       QUERY PLAN                                                                       
-- -------------------------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using field_comprehension_pkey on field_comprehension  (cost=0.28..319.13 rows=4560 width=24) (actual time=0.974..7.826 rows=4530 loops=1)
--  Planning Time: 0.190 ms
--  Execution Time: 7.937 ms
-- (3 rows)


explain analyze select * from field_comprehension where student_id = 700000;
--                                                             QUERY PLAN                                                             
-- -----------------------------------------------------------------------------------------------------------------------------------
--  Bitmap Heap Scan on field_comprehension  (cost=4.51..35.90 rows=30 width=24) (actual time=0.016..0.019 rows=30 loops=1)
--    Recheck Cond: (student_id = 700000)
--    Heap Blocks: exact=1
--    ->  Bitmap Index Scan on field_comprehension_pkey  (cost=0.00..4.51 rows=30 width=0) (actual time=0.011..0.011 rows=30 loops=1)
--          Index Cond: (student_id = 700000)
--  Planning Time: 0.065 ms
--  Execution Time: 0.035 ms
-- (7 rows)


CREATE INDEX student_id_index ON field_comprehension (student_id);


explain analyze select * from field_comprehension order by student_id;
--                                                                   QUERY PLAN                                                                   
-- -----------------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using student_id_index on field_comprehension  (cost=0.28..206.35 rows=4530 width=24) (actual time=0.015..0.629 rows=4530 loops=1)
--  Planning Time: 0.061 ms
--  Execution Time: 0.780 ms
-- (3 rows)



explain analyze select * from field_comprehension where student_id = 700000;
--                                                         QUERY PLAN                                                         
-- ---------------------------------------------------------------------------------------------------------------------------
--  Bitmap Heap Scan on field_comprehension  (cost=4.51..35.90 rows=30 width=24) (actual time=0.016..0.018 rows=30 loops=1)
--    Recheck Cond: (student_id = 700000)
--    Heap Blocks: exact=1
--    ->  Bitmap Index Scan on student_id_index  (cost=0.00..4.51 rows=30 width=0) (actual time=0.011..0.011 rows=30 loops=1)
--          Index Cond: (student_id = 700000)
--  Planning Time: 0.076 ms
--  Execution Time: 0.035 ms
-- (7 rows)


