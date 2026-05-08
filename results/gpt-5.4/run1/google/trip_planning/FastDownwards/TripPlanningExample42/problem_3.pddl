(define (problem tripplanningexample42_problem)
  (:domain tripplanningexample42)

  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (current_day d1)
    (last_day d11)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)

    (direct paris nice)
    (direct nice paris)
    (direct nice mykonos)
    (direct mykonos nice)

    (friend_window_day d1)
    (friend_window_day d2)
    (friend_window_day d3)
    (friend_window_day d4)
  )

  (:goal
    (and
      (current_day d11)
      (met_friends)

      (visited_paris d1)
      (visited_paris d2)
      (visited_paris d3)
      (visited_paris d4)

      (visited_nice d4)
      (visited_nice d5)
      (visited_nice d6)
      (visited_nice d7)
      (visited_nice d8)

      (visited_mykonos d8)
      (visited_mykonos d9)
      (visited_mykonos d10)
      (visited_mykonos d11)
    )
  )
)