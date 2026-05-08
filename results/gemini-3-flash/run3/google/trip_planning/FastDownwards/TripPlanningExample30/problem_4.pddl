(define (problem trip_example_30)
  (:domain trip_planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    ;; The traveler starts at Zurich on Day 1.
    (at zurich)
    (current_day d1)
    (visited zurich d1)

    ;; Temporal sequence from Day 1 to the end of Day 14 (Day 15).
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15)

    ;; Direct flight connections (bidirectional).
    (conn istanbul tallinn) (conn tallinn istanbul)
    (conn istanbul zurich) (conn zurich istanbul)
    (conn tallinn zurich) (conn zurich tallinn)
  )
  (:goal
    (and
      ;; The trip must last 14 days.
      (current_day d15)

      ;; Show constraint: Zurich from Day 1 to Day 7.
      (visited zurich d1)
      (visited zurich d2)
      (visited zurich d3)
      (visited zurich d4)
      (visited zurich d5)
      (visited zurich d6)
      (visited zurich d7)

      ;; Istanbul requirement: 5 days.
      ;; We can identify specific days that satisfy the constraint with the overlap logic.
      (visited istanbul d7)
      (visited istanbul d8)
      (visited istanbul d9)
      (visited istanbul d10)
      (visited istanbul d11)

      ;; Tallinn requirement: 4 days.
      (visited tallinn d11)
      (visited tallinn d12)
      (visited tallinn d13)
      (visited tallinn d14)
    )
  )
)