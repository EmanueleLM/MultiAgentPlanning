(define (problem visit_cities)
  (:domain travel_plan)

  (:objects
    lyon bucharest manchester - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10
    day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (at manchester day_1)
    (current_day day_1)
    (flight_available manchester bucharest)
    (flight_available bucharest lyon)
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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)
  )

  (:goal (and
    (visited manchester)
    (visited bucharest)
    (visited lyon)
    (at lyon day_13)
  ))
)