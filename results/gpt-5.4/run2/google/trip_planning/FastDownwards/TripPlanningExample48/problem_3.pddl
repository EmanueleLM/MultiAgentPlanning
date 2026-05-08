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

    (friend_window d2)
    (friend_window d3)
  )

  (:goal
    (and
      (at manchester d1)
      (at manchester d2)
      (at split d2)
      (at split d3)
      (at geneva d3)
      (at geneva d4)
    )
  )
)