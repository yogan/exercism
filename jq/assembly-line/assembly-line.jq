def production_rate_per_hour:
  if   . == 10 then 0.77
  elif . ==  9 then 0.80
  elif .  >  4 then 0.90
  else              1.00
  end * 221 * .
;

def working_items_per_minute:
  production_rate_per_hour | . / 60 | floor
;

.speed | (production_rate_per_hour, working_items_per_minute)
