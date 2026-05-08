(define (problem tripplanningexample43)
  (:domain european_trip_10_days_instance)

  (:objects
    dublin porto venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)
  )

  (:goal
    (and
      (current_day d10)
      (met_friends)

      (visited_on venice d1)
      (visited_on venice d2)
      (visited_on venice d3)
      (visited_on venice d4)

      (visited_on porto d5)
      (visited_on porto d6)
      (visited_on porto d7)
      (visited_on porto d8)

      (visited_on dublin d9)
      (visited_on dublin d10)
    )
  )
)