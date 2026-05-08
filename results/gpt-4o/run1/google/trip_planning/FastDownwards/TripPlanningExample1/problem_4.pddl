(define (problem travel_plan)
  (:domain travel_schedule)
  (:objects
    split manchester riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 
    day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )
  (:init
    (at split day_1)
    (can_fly riga manchester)
    (can_fly manchester riga)
    (can_fly manchester split)
    (next_day day_1 day_2) (next_day day_2 day_3)
    (next_day day_3 day_4) (next_day day_4 day_5)
    (next_day day_5 day_6) (next_day day_6 day_7)
    (next_day day_7 day_8) (next_day day_8 day_9)
    (next_day day_9 day_10) (next_day day_10 day_11)
    (next_day day_11 day_12) (next_day day_12 day_13)
    (next_day day_13 day_14) (next_day day_14 day_15)
  )
  (:goal (and
    (at riga day_7)
    (at manchester day_11)
    (at split day_15)
  ))
)