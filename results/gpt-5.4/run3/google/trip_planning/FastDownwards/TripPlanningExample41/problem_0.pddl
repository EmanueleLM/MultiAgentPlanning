(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    stockholm athens mykonos - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct stockholm athens)
    (direct athens stockholm)
    (direct athens mykonos)
    (direct mykonos athens)

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
    (next_day day_11 day_12)
    (next_day day_12 day_13)

    (current_day day_1)
    (at stockholm)

    (assigned day_1)
    (spent day_1 stockholm)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (assigned day_10)
      (assigned day_11)
      (assigned day_12)
      (assigned day_13)

      (spent day_1 stockholm)
      (spent day_2 stockholm)
      (spent day_3 stockholm)
      (spent day_4 stockholm)
      (spent day_5 stockholm)
      (spent day_6 stockholm)

      (spent day_7 athens)
      (spent day_8 athens)
      (spent day_9 athens)
      (spent day_10 athens)
      (spent day_11 athens)

      (spent day_10 mykonos)
      (spent day_11 mykonos)
      (spent day_12 mykonos)
      (spent day_13 mykonos)
    )
  )
)