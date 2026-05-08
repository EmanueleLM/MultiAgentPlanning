(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    split manchester riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )
  (:init
    (not_started)
    (current_day d1)
    (stay_count split n0)
    (stay_count manchester n0)
    (stay_count riga n0)

    ;; Day sequence for exactly 15 days (d1 to d16 represents 15 intervals)
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

    ;; Integer counting for stay durations
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)

    ;; Flight connectivity
    (can_fly riga manchester)
    (can_fly manchester riga)
    (can_fly manchester split)
  )
  (:goal
    (and
      ;; Requirements: Split (6 days), Manchester (4 days), Riga (7 days)
      (stay_count split n6)
      (stay_count manchester n4)
      (stay_count riga n7)
      ;; Total trip must span exactly 15 days
      (current_day d16)
    )
  )
)