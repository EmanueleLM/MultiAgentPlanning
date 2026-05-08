(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    reykjavik vienna venice - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    r1 r2 - quota
    v1 v2 v3 v4 v5 v6 v7 - quota
    ve1 ve2 ve3 ve4 - quota
  )

  (:init
    (current_day day_1)
    (start_unchosen)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)

    (last_day day_11)

    (direct_flight reykjavik vienna)
    (direct_flight vienna reykjavik)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (rq r1)
    (rq r2)

    (vq v1)
    (vq v2)
    (vq v3)
    (vq v4)
    (vq v5)
    (vq v6)
    (vq v7)

    (veq ve1)
    (veq ve2)
    (veq ve3)
    (veq ve4)
  )

  (:goal
    (and
      (trip_finished)
      (wedding_attended)

      (day_recorded day_1)
      (day_recorded day_2)
      (day_recorded day_3)
      (day_recorded day_4)
      (day_recorded day_5)
      (day_recorded day_6)
      (day_recorded day_7)
      (day_recorded day_8)
      (day_recorded day_9)
      (day_recorded day_10)
      (day_recorded day_11)

      (not (rq r1))
      (not (rq r2))

      (not (vq v1))
      (not (vq v2))
      (not (vq v3))
      (not (vq v4))
      (not (vq v5))
      (not (vq v6))
      (not (vq v7))

      (not (veq ve1))
      (not (veq ve2))
      (not (veq ve3))
      (not (veq ve4))
    )
  )
)