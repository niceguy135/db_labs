EXPLAIN ANALYZE SELECT * from Test
WHERE CODE_1 ~* '^a'
ORDER BY CODE_1;
--                                                            QUERY PLAN                                                            
-- ---------------------------------------------------------------------------------------------------------------------------------
--  Gather Merge  (cost=20400.81..26293.36 rows=50504 width=70) (actual time=96.640..116.808 rows=62400 loops=1)
--    Workers Planned: 2
--    Workers Launched: 2
--    ->  Sort  (cost=19400.79..19463.92 rows=25252 width=70) (actual time=92.074..94.120 rows=20800 loops=3)
--          Sort Key: code_1
--          Sort Method: quicksort  Memory: 3810kB
--          Worker 0:  Sort Method: quicksort  Memory: 3344kB
--          Worker 1:  Sort Method: quicksort  Memory: 3378kB
--          ->  Parallel Seq Scan on test  (cost=0.00..17554.35 rows=25252 width=70) (actual time=0.036..71.555 rows=20800 loops=3)
--                Filter: ((code_1)::text ~* '^a'::text)
--                Rows Removed by Filter: 312535
--  Planning Time: 0.095 ms
--  Execution Time: 118.037 ms
-- (13 rows)
