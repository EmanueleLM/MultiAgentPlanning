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
    (planned_duration manchester day_7)
    (planned_duration bucharest day_7)
    (planned_duration lyon day_5)
  )

  (:goal (and
    (visited manchester)
    (visited bucharest)
    (visited lyon)
    (at lyon day_13)
    (at lyon day_17)
  ))
)