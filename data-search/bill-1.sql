SELECT date, ordering, pref_label::varchar(20),
       birthyear, extract(year from date) - birthyear AS age
FROM registers
JOIN register_plays ON (register_id = registers.id)
JOIN play_person USING (play_id)
JOIN person ON (person_id = person.id)
ORDER BY date
