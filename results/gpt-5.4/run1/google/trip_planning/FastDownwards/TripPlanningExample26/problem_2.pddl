(define (problem tripplanningexample26_problem)
  (:domain tripplanningexample26)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
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

    (current_day d1)
    (at porto)
    (visited_on porto d1)
  )

  (:goal
    (and
      (current_day d16)
      (met_friend)

      (visited_on porto d1)
      (visited_on porto d2)
      (visited_on porto d3)
      (visited_on porto d4)
      (visited_on porto d5)
      (visited_on porto d6)
      (visited_on porto d7)

      (visited_on berlin d8)
      (visited_on berlin d9)
      (visited_on berlin d10)
      (visited_on berlin d11)
      (visited_on berlin d12)
      (visited_on berlin d13)

      (visited_on reykjavik d12)
      (visited_on reykjavik d13)
      (visited_on reykjavik d14)
      (visited_on reykjavik d15)
      (visited_on reykjavik d16)
    )
  )
)