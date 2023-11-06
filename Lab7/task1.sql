do
$$
DECLARE
    prof_id INTEGER := 81007;
    zet_sum INTEGER;
    wage INTEGER;
    professor_SNP record;
BEGIN
    SELECT surname, name, patronymic
    INTO professor_SNP
    FROM professor
    WHERE professor_id = prof_id;

    SELECT sum(zet)
    INTO zet_sum
    FROM field
    WHERE professor_id = prof_id;

    SELECT wage_rate
    INTO wage
    FROM employment
    WHERE professor_id = prof_id;

    raise notice 'ФИО:  %  %  %',   professor_SNP.surname, professor_SNP.name, professor_SNP.patronymic;
    raise notice 'Ставка:  %', wage;
    raise notice 'Сумма ЗЕТов:  %', zet_sum;

END;
$$