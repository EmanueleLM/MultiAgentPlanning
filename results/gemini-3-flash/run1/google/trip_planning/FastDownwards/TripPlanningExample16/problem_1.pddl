(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Starting position: Prague on Day 1
    (at prague d1)

    ;; Initialize stay counts
    (prague_stay c0)
    (vienna_stay c0)
    (porto_stay c0)

    ;; Count sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Day sequence (9 days total)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Flight routes
    (flight vienna porto)
    (flight porto vienna)
    (flight prague vienna)
    (flight vienna prague)
  )
  (:goal (and
    ;; Stay duration requirements
    (prague_stay c3)
    (vienna_stay c3)
    (porto_stay c5)

    ;; Workshop constraint: must spend Day 1, 2, and 3 in Prague
    (spent_prague d1)
    (spent_prague d2)
    (spent_prague d3)
  ))
)