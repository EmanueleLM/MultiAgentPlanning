(define (problem tripplanningexample3)
  (:domain european_trip_6_days)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 d7 - day
  )

  (:init
    (current_day d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)
  )

  (:goal
    (and
      (current_day d7)
      (met_friend)

      (visit_day d1 berlin)
      (visit_day d2 berlin)
      (visit_day d3 berlin)

      (visit_day d4 warsaw)
      (visit_day d5 warsaw)

      (visit_day d6 bucharest)
    )
  )
)