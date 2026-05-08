(define (problem european_trip_instance)
  (:domain european_trip_7_days)

  (:objects
    paris istanbul salzburg - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)

    (direct paris istanbul)
    (direct istanbul paris)
    (direct istanbul salzburg)
    (direct salzburg istanbul)

    (current_day day_1)
    (at paris day_1)
  )

  (:goal
    (and
      (current_day day_7)

      (at paris day_1)
      (at paris day_2)
      (not (at paris day_3))
      (not (at paris day_4))
      (not (at paris day_5))
      (not (at paris day_6))
      (not (at paris day_7))

      (at istanbul day_3)
      (at istanbul day_4)
      (not (at istanbul day_1))
      (not (at istanbul day_2))
      (not (at istanbul day_5))
      (not (at istanbul day_6))
      (not (at istanbul day_7))

      (at salzburg day_3)
      (at salzburg day_4)
      (at salzburg day_5)
      (at salzburg day_6)
      (at salzburg day_7)
      (not (at salzburg day_1))
      (not (at salzburg day_2))
    )
  )
)