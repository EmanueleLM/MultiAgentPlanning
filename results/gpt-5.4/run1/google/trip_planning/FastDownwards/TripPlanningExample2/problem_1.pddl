(define (problem tripplanningexample2)
  (:domain european_trip_11_days_instance)

  (:objects
    reykjavik vienna venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (start_unassigned)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)

    (direct_flight reykjavik vienna)
    (direct_flight vienna reykjavik)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (need_reykjavik_2)
    (need_vienna_7)
    (need_venice_4)
  )

  (:goal
    (and
      (used_day day_11)
      (done_reykjavik)
      (done_vienna)
      (done_venice)
      (wedding_attended)
    )
  )
)