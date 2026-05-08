(define (problem tripplanningexample42_problem)
  (:domain tripplanningexample42)

  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (at paris)
    (current_day d1)

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
      (current_day d12)
      (met_friends)

      (visited_on paris d1)
      (visited_on paris d2)
      (visited_on paris d3)
      (visited_on paris d4)

      (visited_on nice d5)
      (visited_on nice d9)
      (visited_on nice d10)
      (visited_on nice d11)
      (visited_on nice d12)

      (visited_on mykonos d6)
      (visited_on mykonos d7)
      (visited_on mykonos d8)
      (visited_on mykonos d9)
    )
  )
)