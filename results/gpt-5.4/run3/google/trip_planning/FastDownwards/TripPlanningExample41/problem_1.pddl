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
    (next day_11 day_12)
    (next day_12 day_13)

    (current_day day_1)
    (at stockholm)

    (spent day_1 stockholm)

    (day_open day_2)
    (day_open day_3)
    (day_open day_4)
    (day_open day_5)
    (day_open day_6)
    (day_open day_7)
    (day_open day_8)
    (day_open day_9)
    (day_open day_10)
    (day_open day_11)
    (day_open day_12)
    (day_open day_13)

    (conference day_1 stockholm)
    (conference day_6 stockholm)
  )

  (:goal
    (and
      (spent day_1 stockholm)
      (spent day_6 stockholm)

      (spent day_2 stockholm)
      (spent day_3 stockholm)
      (spent day_4 stockholm)
      (spent day_5 stockholm)

      (spent day_7 athens)
      (spent day_8 athens)
      (spent day_9 athens)
      (spent day_10 athens)
      (spent day_11 athens)

      (spent day_12 mykonos)
      (spent day_13 mykonos)
    )
  )
)