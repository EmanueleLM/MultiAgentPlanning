(define (problem trip-itinerary-problem)
  (:domain trip-itinerary)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    ; day adjacency (11 consecutive days)
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

    ; direct flight graph (only allowed routes)
    (connected reykjavik vienna)
    (connected vienna reykjavik)
    (connected vienna venice)
    (connected venice vienna)

    ; city-day availability to encode durations and the Venice wedding window
    (allowed reykjavik d1)
    (allowed reykjavik d2)

    (allowed vienna d3)
    (allowed vienna d4)
    (allowed vienna d5)
    (allowed vienna d6)
    (allowed vienna d7)

    (allowed venice d8)
    (allowed venice d9)
    (allowed venice d10)
    (allowed venice d11)

    ; start state
    (at d1 reykjavik)
    (filled d1)
  )
  (:goal (and
    ; exactly 11 days must be filled; availability enforces where you can be
    (filled d2)
    (filled d3)
    (filled d4)
    (filled d5)
    (filled d6)
    (filled d7)
    (filled d8)
    (filled d9)
    (filled d10)
    (filled d11)
  ))
)