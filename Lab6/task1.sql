CREATE TABLE Test(
id SERIAL PRIMARY KEY,
CODE_1 VARCHAR(64),
CODE_2 VARCHAR(64)
);


DO
$$
BEGIN
FOR i IN 1..1000000 LOOP
INSERT INTO Test(code_1,code_2) VALUES(md5(random()::text),
md5(random()::text));
END LOOP;
END
$$ language plpgsql;


EXPLAIN ANALYZE INSERT INTO Test (CODE_1)
VALUES (228);
--                                          QUERY PLAN                                         
-- --------------------------------------------------------------------------------------------
--  Insert on test  (cost=0.00..0.01 rows=0 width=0) (actual time=0.035..0.036 rows=0 loops=1)
--    ->  Result  (cost=0.00..0.01 rows=1 width=182) (actual time=0.012..0.013 rows=1 loops=1)
--  Planning Time: 0.032 ms
--  Execution Time: 0.047 ms
-- (4 rows)


EXPLAIN ANALYZE SELECT * FROM Test ORDER BY CODE_1;
--                                                             QUERY PLAN                                                             
-- -----------------------------------------------------------------------------------------------------------------------------------
--  Gather Merge  (cost=73496.00..170725.09 rows=833334 width=70) (actual time=336.862..750.974 rows=1000003 loops=1)
--    Workers Planned: 2
--    Workers Launched: 2
--    ->  Sort  (cost=72495.98..73537.65 rows=416667 width=70) (actual time=328.174..475.249 rows=333334 loops=3)
--          Sort Key: code_1
--          Sort Method: external merge  Disk: 26528kB
--          Worker 0:  Sort Method: external merge  Disk: 26512kB
--          Worker 1:  Sort Method: external merge  Disk: 25456kB
--          ->  Parallel Seq Scan on test  (cost=0.00..16512.67 rows=416667 width=70) (actual time=0.006..13.954 rows=333334 loops=3)
--  Planning Time: 0.173 ms
--  Execution Time: 773.488 ms
-- (11 rows)



CREATE INDEX code1_index ON Test (CODE_1);



EXPLAIN ANALYZE INSERT INTO Test (CODE_1)
VALUES (228);
--                                          QUERY PLAN                                         
-- --------------------------------------------------------------------------------------------
--  Insert on test  (cost=0.00..0.01 rows=0 width=0) (actual time=0.163..0.163 rows=0 loops=1)
--    ->  Result  (cost=0.00..0.01 rows=1 width=182) (actual time=0.005..0.005 rows=1 loops=1)
--  Planning Time: 0.033 ms
--  Execution Time: 0.175 ms
-- (4 rows)
`

EXPLAIN ANALYZE SELECT * FROM Test ORDER BY CODE_1;
--                                                              QUERY PLAN                                                              
-- -------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using code1_index on test  (cost=0.42..93222.37 rows=1000003 width=70) (actual time=0.045..403.389 rows=1000004 loops=1)
--  Planning Time: 0.097 ms
--  Execution Time: 422.456 ms
-- (3 rows)
