(define (problem tripplanningexample48)
  (:domain european_trip_4_days)

  (:objects)

  (:init
    (current d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)

    (direct manchester split)
    (direct split manchester)
    (direct manchester geneva)
    (direct geneva manchester)
    (direct split geneva)
    (direct geneva split)

    (meeting_day d2)
    (meeting_day d3)
  )

  (:goal
    (and
      (visited_on manchester d1)
      (visited_on manchester d2)
      (visited_on split d3)
      (visited_on split d4)
      (met_friend)
    )
  )
)