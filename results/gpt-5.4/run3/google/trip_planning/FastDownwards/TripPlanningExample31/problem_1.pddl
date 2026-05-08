(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at frankfurt)
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

    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight split frankfurt)
    (direct_flight frankfurt split)
  )

  (:goal
    (and
      (current_day d11)

      (visited_on frankfurt d1)
      (visited_on frankfurt d2)

      (visited_on reykjavik d8)
      (visited_on reykjavik d9)
      (visited_on reykjavik d10)

      (visited_on split d3)
      (visited_on split d4)
      (visited_on split d5)
      (visited_on split d6)
      (visited_on split d7)
      (visited_on split d8)
      (visited_on split d9)
    )
  )
)