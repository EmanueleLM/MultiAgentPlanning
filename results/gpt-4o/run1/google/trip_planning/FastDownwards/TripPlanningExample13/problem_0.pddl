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
  )

  (:goal (and
    (at lyon day_17)
    (visited manchester)
    (visited bucharest)
    (visited lyon)
    ;; Ensure specific days spent in each city
    (at manchester day_7)
    (at bucharest day_14)
    (at lyon day_17)
    (visited lyon)
  ))
)