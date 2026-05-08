(define (problem trip_planning_example_1)
  (:domain trip_planning)
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 - count
  )
  (:init
    ;; Starting position and initial day counts.
    ;; The plan starts at Riga on Day 1.
    (at riga)
    (day_now d1)
    (spent riga c1)
    (spent manchester c0)
    (spent split c0)

    ;; Define the chronological sequence of days.
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

    ;; Define the sequence for counting days spent in each city.
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)
    (next_count c12 c13)
    (next_count c13 c14)
    (next_count c14 c15)

    ;; Define direct flight connections between cities.
    (can_fly riga manchester)
    (can_fly manchester riga)
    (can_fly manchester split)
  )
  (:goal
    (and
      ;; Total days spent in each city must match human specifications.
      (spent riga c7)
      (spent manchester c4)
      (spent split c6)
      ;; The final day reached should be day 15.
      (day_now d15)
    )
  )
)