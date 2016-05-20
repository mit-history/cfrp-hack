select date, sum(price * sold) as receipts, min(title_1), min(title_2)
from cfrp where title_1 in ('Bérénice', 'Phaedre') or title_2 in ('Bérénice', 'Phaedre')
group by date
