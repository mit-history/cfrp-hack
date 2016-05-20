
with by_season as (
     select r.season,p.id play_id, p.title title, count(rp.id) nb_perfs
     from plays p join register_plays rp on p.id=rp.play_id
                  join registers r on rp.register_id=r.id
     where p.author ILIKE '%racine%'
     group by r.season,p.id, p.title)
select r.season, count(distinct rp.id), avg(nb_perfs)
from by_season bs join registers r on r.season=bs.season
     join register_plays rp on rp.register_id=r.id
where rp.play_id=5294
group by r.season
having count(distinct rp.id) < round(avg(nb_perfs))
order by 1;

