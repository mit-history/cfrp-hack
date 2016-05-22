WITH info AS(
  SELECT season, date, ordering, pref_label::varchar(20),
         birthyear, extract(year from date)::INT - birthyear::INT AS age
  FROM registers
  JOIN register_plays ON (register_id = registers.id)
  JOIN play_person USING (play_id)
  JOIN person ON (person_id = person.id)
  ORDER BY date)
SELECT (EXTRACT(YEAR FROM date) /5)::INT*5 AS year,
  min(age) AS min,
  percentile_cont(0.25) WITHIN GROUP (ORDER BY age) AS q1_age,
  percentile_cont(0.5) WITHIN GROUP (ORDER BY age) AS median_age,
  percentile_cont(0.75) WITHIN GROUP (ORDER BY age) AS q2_age,
  max(age) as max
FROM info WHERE age IS NOT NULL
GROUP BY year
ORDER BY year;
