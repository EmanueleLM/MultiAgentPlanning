(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    reykjavik riga paris - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (current_day day_1)

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

    (counted_reykjavik_0)
    (counted_riga_0)
    (counted_paris_0)
  )

  (:goal
    (and
      (trip_finished)
      (at reykjavik day_6)
      (at reykjavik day_7)
      (at reykjavik day_8)
      (at reykjavik day_9)
      (at reykjavik day_10)
      (counted_reykjavik_5)
      (counted_riga_3)
      (counted_paris_4)
    )
  )
)