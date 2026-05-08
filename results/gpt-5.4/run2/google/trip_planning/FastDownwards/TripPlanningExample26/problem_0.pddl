(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (current_day d1)

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

    (porto_count_0)
    (berlin_count_0)
    (reykjavik_count_0)
  )

  (:goal
    (and
      (trip_finished)
      (porto_count_7)
      (berlin_count_6)
      (reykjavik_count_5)
      (met_friend)
    )
  )
)