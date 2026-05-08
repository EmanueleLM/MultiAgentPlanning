(define (problem european_trip_6_days_instance)
  (:domain european_trip_6_days)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 d7 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)

    (current_day d1)

    (berlin_count_0)
    (warsaw_count_0)
    (bucharest_count_0)
  )

  (:goal
    (and
      (current_day d7)
      (met_friend)
      (berlin_count_3)
      (warsaw_count_3)
      (bucharest_count_2)
    )
  )
)