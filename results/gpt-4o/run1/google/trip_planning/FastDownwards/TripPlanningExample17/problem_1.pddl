(define (problem travel_plan_instance)
  (:domain travel_plan)

  (:objects
    copenhagen vienna lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at_city day_1 copenhagen)
    (current_day day_1)
    (direct_flight copenhagen vienna)
    (direct_flight vienna lyon)
    (conference day_1 copenhagen)
    (conference day_5 copenhagen)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
  )
  
  (:goal (and
    (at_city day_1 copenhagen)
    (at_city day_2 copenhagen)
    (at_city day_3 copenhagen)
    (at_city day_4 copenhagen)
    (at_city day_5 copenhagen)
    (at_city day_6 vienna)
    (at_city day_7 vienna)
    (at_city day_8 vienna)
    (at_city day_9 vienna)
    (at_city day_10 lyon)
    (at_city day_11 lyon)
    (conference day_1 copenhagen)
    (conference day_5 copenhagen)
  ))
)