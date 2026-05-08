(define (problem trip_planning_example29_problem)
  (:domain trip_planning_example29)

  (:objects
    frankfurt krakow dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)
    (direct_flight dubrovnik frankfurt)
    (direct_flight frankfurt dubrovnik)

    (current day_1)
    (at dubrovnik)
    (visited dubrovnik day_1)
  )

  (:goal
    (and
      (visited dubrovnik day_1)
      (visited dubrovnik day_2)
      (visited dubrovnik day_3)
      (visited dubrovnik day_4)
      (visited dubrovnik day_5)
      (visited dubrovnik day_6)
      (visited dubrovnik day_7)

      (visited frankfurt day_8)
      (visited krakow day_9)
      (visited krakow day_10)
    )
  )
)