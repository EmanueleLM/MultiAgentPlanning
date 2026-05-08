(define (problem trip_planning_example26_problem)
  (:domain trip_planning_example26)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
  )

  (:init
    (at porto)
    (current d1)

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
    (next d16 d17)

    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    (friend_window d12)
    (friend_window d13)
    (friend_window d14)
    (friend_window d15)
    (friend_window d16)

    (stay_day porto d1)
    (stay_day porto d2)
    (stay_day porto d3)
    (stay_day porto d4)
    (stay_day porto d5)
    (stay_day porto d6)
    (stay_day porto d7)

    (stay_day berlin d8)
    (stay_day berlin d9)
    (stay_day berlin d10)
    (stay_day berlin d11)
    (stay_day berlin d12)
    (stay_day berlin d13)

    (stay_day reykjavik d13)
    (stay_day reykjavik d14)
    (stay_day reykjavik d15)
    (stay_day reykjavik d16)
    (stay_day reykjavik d17)
  )

  (:goal
    (and
      (current d17)
      (at reykjavik)
      (friend_met))
  )
)