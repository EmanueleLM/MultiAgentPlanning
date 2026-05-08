(define (problem trip_planning_example26_instance)
  (:domain trip_planning_example26)

  (:objects
    porto berlin reykjavik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (today d0)

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
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    (friend_window d12)
    (friend_window d13)
    (friend_window d14)
    (friend_window d15)
    (friend_window d16)
  )

  (:goal
    (and
      (today d16)

      (visited porto)
      (visited berlin)
      (visited reykjavik)

      (at porto d1)
      (at porto d2)
      (at porto d3)
      (at porto d4)
      (at porto d5)
      (at porto d6)
      (at porto d7)

      (at berlin d8)
      (at berlin d9)
      (at berlin d10)
      (at berlin d11)
      (at berlin d12)
      (at berlin d13)

      (at reykjavik d14)
      (at reykjavik d15)
      (at reykjavik d16)

      (met_friend)
    )
  )
)