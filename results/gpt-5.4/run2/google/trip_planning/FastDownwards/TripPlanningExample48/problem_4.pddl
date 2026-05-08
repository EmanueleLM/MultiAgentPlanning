(define (problem tripplanningexample48)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    d1 d2 d3 d4 - day
  )

  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)

    (direct split geneva)
    (direct geneva split)
    (direct manchester split)
    (direct split manchester)
    (direct manchester geneva)
    (direct geneva manchester)
  )

  (:goal
    (and
      (occupied d1)
      (occupied d2)
      (occupied d3)
      (occupied d4)

      (visited_split_day d1)
      (visited_split_day d2)

      (visited_manchester_day d3)
      (visited_manchester_day d4)

      (visited_geneva_day d1)
      (visited_geneva_day d4)

      (met_friend)
    )
  )
)