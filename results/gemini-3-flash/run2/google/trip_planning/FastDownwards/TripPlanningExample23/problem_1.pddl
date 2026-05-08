(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    n0 n1 n2 n3 n4 - count
  )
  (:init
    ;; Timeline
    (at_day d1)
    (not_started)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Counting
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)

    (stay_count london n0)
    (stay_count bucharest n0)
    (stay_count riga n0)

    ;; Connectivity
    (can_fly london bucharest)
    (can_fly bucharest london)
    (can_fly bucharest riga)
    (can_fly riga bucharest)
  )
  (:goal
    (and
      ;; Complete exactly 8 days of travel (reaching d9 marker)
      (at_day d9)

      ;; Exact duration constraints
      (stay_count london n3)
      (stay_count bucharest n3)
      (stay_count riga n4)

      ;; Workshop constraints (Riga between day 5 and day 8)
      (visited riga d5)
      (visited riga d6)
      (visited riga d7)
      (visited riga d8)
    )
  )
)