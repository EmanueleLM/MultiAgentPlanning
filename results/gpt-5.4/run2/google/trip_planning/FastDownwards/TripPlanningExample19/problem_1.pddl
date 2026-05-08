(define (problem tripplanningexample19_problem)
  (:domain tripplanningexample19)

  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    b0 b1 b2 - count_b
    v0 v1 v2 v3 - count_v
    n0 n1 n2 n3 n4 n5 n6 - count_n
  )

  (:init
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

    (next_b b0 b1)
    (next_b b1 b2)

    (next_v v0 v1)
    (next_v v1 v2)
    (next_v v2 v3)

    (next_n n0 n1)
    (next_n n1 n2)
    (next_n n2 n3)
    (next_n n3 n4)
    (next_n n4 n5)
    (next_n n5 n6)

    (friend_window d1)
    (friend_window d2)
    (friend_window d3)
    (friend_window d4)
    (friend_window d5)
    (friend_window d6)

    (current_day d1)
    (brussels_days b0)
    (valencia_days v0)
    (nice_days n0)
  )

  (:goal
    (and
      (trip_complete)
      (brussels_days b2)
      (valencia_days v3)
      (nice_days n6)
      (met_friends)
      (visited d1 nice)
      (visited d2 nice)
      (visited d3 nice)
      (visited d4 nice)
      (visited d5 nice)
      (visited d6 nice)
      (visited d7 valencia)
      (visited d8 valencia)
      (visited d9 brussels)
    )
  )
)