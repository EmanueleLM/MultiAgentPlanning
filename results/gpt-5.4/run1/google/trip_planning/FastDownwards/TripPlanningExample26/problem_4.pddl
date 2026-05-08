(define (problem tripplanningexample26_problem)
  (:domain tripplanningexample26)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

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

    (friend_window d12)
    (friend_window d13)
    (friend_window d14)
    (friend_window d15)
    (friend_window d16)

    (at porto)
    (current d1)
    (on_day porto d1)
  )

  (:goal
    (and
      (current d16)
      (met_friend)

      (on_day porto d1)
      (on_day porto d2)
      (on_day porto d3)
      (on_day porto d4)
      (on_day porto d5)
      (on_day porto d6)
      (on_day porto d7)

      (on_day berlin d8)
      (on_day berlin d9)
      (on_day berlin d10)
      (on_day berlin d11)
      (on_day berlin d12)
      (on_day berlin d13)

      (on_day reykjavik d12)
      (on_day reykjavik d13)
      (on_day reykjavik d14)
      (on_day reykjavik d15)
      (on_day reykjavik d16)
    )
  )
)