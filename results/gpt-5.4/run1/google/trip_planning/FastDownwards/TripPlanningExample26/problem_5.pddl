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
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)
    (next_day d15 d16)

    (friend_window d12)
    (friend_window d13)
    (friend_window d14)
    (friend_window d15)
    (friend_window d16)

    (at porto)
    (current_day d1)
    (visit_on porto d1)
  )

  (:goal
    (and
      (current_day d16)
      (met_friend)

      (visit_on porto d1)
      (visit_on porto d2)
      (visit_on porto d3)
      (visit_on porto d4)
      (visit_on porto d5)
      (visit_on porto d6)
      (visit_on porto d7)

      (visit_on berlin d8)
      (visit_on berlin d9)
      (visit_on berlin d10)
      (visit_on berlin d11)

      (visit_on reykjavik d12)
      (visit_on reykjavik d13)
      (visit_on reykjavik d14)
      (visit_on reykjavik d15)
      (visit_on reykjavik d16)
    )
  )
)