(define (problem tripplanningexample32)
  (:domain european_trip_10_days)

  (:objects
    reykjavik riga paris - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
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

    (direct_flight paris reykjavik)
    (direct_flight reykjavik paris)
    (direct_flight riga paris)
    (direct_flight paris riga)
  )

  (:goal
    (and
      (visited_on d1 riga)
      (visited_on d2 riga)
      (visited_on d3 riga)

      (visited_on d4 paris)
      (visited_on d5 paris)

      (visited_on d6 reykjavik)
      (visited_on d7 reykjavik)
      (visited_on d8 reykjavik)
      (visited_on d9 reykjavik)
      (visited_on d10 reykjavik)
    )
  )
)