(define (problem tripplanningexample48)
  (:domain european_trip_4_days)

  (:objects
    manchester split geneva - city
    d1 d2 d3 d4 - day
  )

  (:init
    (current d1)

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
      (visited_split_2_days)
      (visited_manchester_2_days)
      (visited_geneva_2_days)
      (friend_met_in_split)
    )
  )
)