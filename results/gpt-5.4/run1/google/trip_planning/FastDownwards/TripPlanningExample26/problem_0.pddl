(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
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

    (direct berlin reykjavik)
    (direct reykjavik berlin)
    (direct porto berlin)
    (direct berlin porto)

    (current_day d1)
    (at porto)
    (day_assigned d1)
    (spent_in_porto d1)
  )

  (:goal
    (and
      (current_day d16)
      (met_friend)

      (spent_in_porto d1)
      (spent_in_porto d2)
      (spent_in_porto d3)
      (spent_in_porto d4)
      (spent_in_porto d5)
      (spent_in_porto d6)
      (spent_in_porto d7)

      (spent_in_berlin d8)
      (spent_in_berlin d9)
      (spent_in_berlin d10)
      (spent_in_berlin d11)
      (spent_in_berlin d12)
      (spent_in_berlin d13)

      (spent_in_reykjavik d12)
      (spent_in_reykjavik d13)
      (spent_in_reykjavik d14)
      (spent_in_reykjavik d15)
      (spent_in_reykjavik d16)
    )
  )
)