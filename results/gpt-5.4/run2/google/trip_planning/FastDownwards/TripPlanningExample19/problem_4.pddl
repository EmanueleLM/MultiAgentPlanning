(define (problem tripplanningexample19_problem)
  (:domain tripplanningexample19)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (at brussels)

    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (friend_window d1)
    (friend_window d2)
    (friend_window d3)
    (friend_window d4)
    (friend_window d5)
    (friend_window d6)

    (current_day d1)
  )

  (:goal
    (and
      (trip_complete)
      (met_friends)
      (visited_nice d1)
      (visited_nice d2)
      (visited_nice d3)
      (visited_nice d4)
      (visited_nice d5)
      (visited_nice d6)
      (visited_valencia d7)
      (visited_valencia d8)
      (visited_brussels d9)
    )
  )
)