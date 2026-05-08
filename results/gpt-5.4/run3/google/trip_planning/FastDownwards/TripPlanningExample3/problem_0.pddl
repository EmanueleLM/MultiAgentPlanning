(define (problem european_trip_6_days_instance_problem)
  (:domain european_trip_6_days_instance)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)

    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)

    (current_day d1)

    (berlin_count_0)
    (warsaw_count_0)
    (bucharest_count_0)
  )

  (:goal
    (and
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (trip_complete)
      (berlin_count_3)
      (warsaw_count_3)
      (bucharest_count_2)
      (met_friend)
    )
  )
)