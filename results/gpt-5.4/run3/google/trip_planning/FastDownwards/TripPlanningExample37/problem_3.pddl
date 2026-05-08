(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
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

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)

    (current_day day_1)

    (free day_1)
    (free day_2)
    (free day_3)
    (free day_4)
    (free day_5)
    (free day_6)
    (free day_7)
    (free day_8)
    (free day_9)
    (free day_10)

    (need_rk_6)
    (need_mi_4)
    (need_po_2)
  )

  (:goal
    (and
      (finished)
    )
  )
)