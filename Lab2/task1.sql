DO
$$
DECLARE
summ_real real := 0.0;
summ_num numeric := 0.0;
summ_mon money := 0.0;
BEGIN
FOR i IN 1..100000 LOOP
summ_real := summ_real + 999.99;
summ_num := summ_num + 999.99;
summ_mon := summ_mon + CAST(999.99 AS money);
END LOOP;
RAISE NOTICE 'Summ real = %;', summ_real;
RAISE NOTICE 'Summ numeric = %;', summ_num;
RAISE NOTICE 'Summ money = %;', summ_mon;
RAISE NOTICE 'Diff real = %;', 99999000.00 - summ_real;
RAISE NOTICE 'Diff numeric = %;', 99999000.00 - summ_num;
RAISE NOTICE 'Diff money = %;', CAST(99999000.00 AS money) - summ_mon;
END
$$ language plpgsql;