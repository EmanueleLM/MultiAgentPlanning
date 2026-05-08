(define (problem tripplanningexample3)
  (:domain european_trip_6_days)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 d7 - day
  )

  (:init
    (at berlin)
    (current_day d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)

    (friend_window d5)
    (friend_window d6)
  )

  (:goal
    (and
      (current_day d7)
      (met_friend)

      (visited d1 berlin)
      (visited d2 berlin)
      (visited d3 warsaw)
      (visited d4 warsaw)
      (visited d5 bucharest)
      (visited d6 bucharest)
    )
  )
)