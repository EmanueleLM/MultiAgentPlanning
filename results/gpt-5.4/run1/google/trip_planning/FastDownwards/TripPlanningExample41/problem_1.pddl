(define (problem tripplanningexample41)
  (:domain european_trip_13days_instance)

  (:objects
    stockholm athens mykonos - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (direct athens mykonos)
    (direct mykonos athens)
    (direct stockholm athens)
    (direct athens stockholm)

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

    (at stockholm)
    (day_cursor day_1)
    (visited_on day_1 stockholm)

    (required day_1 stockholm)
    (required day_6 stockholm)
  )

  (:goal
    (and
      (day_cursor day_13)

      (visited_on day_1 stockholm)
      (visited_on day_6 stockholm)

      (visited_on day_1 stockholm)
      (visited_on day_2 stockholm)
      (visited_on day_3 stockholm)
      (visited_on day_4 stockholm)
      (visited_on day_5 stockholm)
      (visited_on day_6 athens)
      (visited_on day_7 athens)
      (visited_on day_8 athens)
      (visited_on day_9 athens)
      (visited_on day_10 mykonos)
      (visited_on day_11 mykonos)
      (visited_on day_12 mykonos)
      (visited_on day_13 mykonos)
    )
  )
)