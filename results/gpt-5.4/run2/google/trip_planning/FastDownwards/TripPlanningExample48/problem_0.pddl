(define (problem european_trip_instance)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)

    (current_day day_1)

    (direct split geneva)
    (direct geneva split)
    (direct manchester split)
    (direct split manchester)
    (direct manchester geneva)
    (direct geneva manchester)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (trip_complete)

      ; exactly 2 days in split
      (or
        (and
          (at day_1 split) (at day_2 split)
          (not (at day_3 split)) (not (at day_4 split)))
        (and
          (at day_1 split) (at day_3 split)
          (not (at day_2 split)) (not (at day_4 split)))
        (and
          (at day_1 split) (at day_4 split)
          (not (at day_2 split)) (not (at day_3 split)))
        (and
          (at day_2 split) (at day_3 split)
          (not (at day_1 split)) (not (at day_4 split)))
        (and
          (at day_2 split) (at day_4 split)
          (not (at day_1 split)) (not (at day_3 split)))
        (and
          (at day_3 split) (at day_4 split)
          (not (at day_1 split)) (not (at day_2 split)))
      )

      ; exactly 2 days in manchester
      (or
        (and
          (at day_1 manchester) (at day_2 manchester)
          (not (at day_3 manchester)) (not (at day_4 manchester)))
        (and
          (at day_1 manchester) (at day_3 manchester)
          (not (at day_2 manchester)) (not (at day_4 manchester)))
        (and
          (at day_1 manchester) (at day_4 manchester)
          (not (at day_2 manchester)) (not (at day_3 manchester)))
        (and
          (at day_2 manchester) (at day_3 manchester)
          (not (at day_1 manchester)) (not (at day_4 manchester)))
        (and
          (at day_2 manchester) (at day_4 manchester)
          (not (at day_1 manchester)) (not (at day_3 manchester)))
        (and
          (at day_3 manchester) (at day_4 manchester)
          (not (at day_1 manchester)) (not (at day_2 manchester)))
      )

      ; exactly 2 days in geneva
      (or
        (and
          (at day_1 geneva) (at day_2 geneva)
          (not (at day_3 geneva)) (not (at day_4 geneva)))
        (and
          (at day_1 geneva) (at day_3 geneva)
          (not (at day_2 geneva)) (not (at day_4 geneva)))
        (and
          (at day_1 geneva) (at day_4 geneva)
          (not (at day_2 geneva)) (not (at day_3 geneva)))
        (and
          (at day_2 geneva) (at day_3 geneva)
          (not (at day_1 geneva)) (not (at day_4 geneva)))
        (and
          (at day_2 geneva) (at day_4 geneva)
          (not (at day_1 geneva)) (not (at day_3 geneva)))
        (and
          (at day_3 geneva) (at day_4 geneva)
          (not (at day_1 geneva)) (not (at day_2 geneva)))
      )

      ; meet friend in split on day_2 or day_3
      (or
        (at day_2 split)
        (at day_3 split)
      )
    )
  )
)