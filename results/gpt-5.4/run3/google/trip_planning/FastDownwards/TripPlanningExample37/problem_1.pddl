(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)

    (current_day day_1)
  )

  (:goal
    (and
      (assigned day_10)
      (at porto day_9)
      (at porto day_10)

      (rk6 day_1 day_2 day_3 day_4 day_5 day_6)
      (po2 day_9 day_10)
      (mi4 day_3 day_4 day_5 day_6)
    )
  )
)