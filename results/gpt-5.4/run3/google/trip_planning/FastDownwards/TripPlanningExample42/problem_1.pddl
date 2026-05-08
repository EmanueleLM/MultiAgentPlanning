(define (problem tripplanningexample42_problem)
  (:domain tripplanningexample42)

  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (at paris)
    (day_now d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)

    (direct_flight paris nice)
    (direct_flight nice paris)
    (direct_flight nice mykonos)
    (direct_flight mykonos nice)

    (friend_window d1)
    (friend_window d2)
    (friend_window d3)
    (friend_window d4)
  )

  (:goal
    (and
      (day_now d12)
      (met_friends)

      (in_paris d1)
      (in_paris d2)
      (in_paris d3)
      (in_paris d4)

      (in_nice d5)
      (in_nice d10)
      (in_nice d11)
      (in_nice d12)
      (in_nice d9)

      (in_mykonos d6)
      (in_mykonos d7)
      (in_mykonos d8)
      (in_mykonos d9)
    )
  )
)