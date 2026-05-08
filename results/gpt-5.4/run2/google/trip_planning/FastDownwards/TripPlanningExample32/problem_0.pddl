(define (problem european_trip_10_days_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    riga paris reykjavik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (ready_to_start)

    (riga_count_0)
    (paris_count_0)
    (reykjavik_count_0)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct_flight paris reykjavik)
    (direct_flight reykjavik paris)
    (direct_flight riga paris)
    (direct_flight paris riga)
  )

  (:goal
    (and
      (at reykjavik day_6)
      (at reykjavik day_7)
      (at reykjavik day_8)
      (at reykjavik day_9)
      (at reykjavik day_10)

      (riga_count_3)
      (paris_count_4)
      (reykjavik_count_5)
    )
  )
)