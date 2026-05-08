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

    (meet_window d2)
    (meet_window d3)
  )

  (:goal
    (and
      (used d1)
      (used d2)
      (used d3)
      (used d4)

      (at manchester d1)
      (at manchester d2)

      (at split d2)
      (at split d3)

      (at geneva d3)
      (at geneva d4)

      (met_friend)
    )
  )
)