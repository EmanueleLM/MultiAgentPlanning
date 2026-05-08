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

    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    (meeting_day d12)
    (meeting_day d13)
    (meeting_day d14)
    (meeting_day d15)
    (meeting_day d16)

    (current_day d1)
    (at porto)
    (in_porto d1)
  )

  (:goal
    (and
      (current_day d16)
      (met_friend)

      (in_porto d1)
      (in_porto d2)
      (in_porto d3)
      (in_porto d4)
      (in_porto d5)
      (in_porto d6)
      (in_porto d7)

      (in_berlin d8)
      (in_berlin d9)
      (in_berlin d10)
      (in_berlin d11)
      (in_berlin d12)
      (in_berlin d13)

      (in_reykjavik d12)
      (in_reykjavik d13)
      (in_reykjavik d14)
      (in_reykjavik d15)
      (in_reykjavik d16)
    )
  )
)