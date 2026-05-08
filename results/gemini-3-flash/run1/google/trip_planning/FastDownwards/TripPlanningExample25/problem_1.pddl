(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 - count
  )
  (:init
    ;; Starting configuration
    (at valencia)
    (current_day d1)
    (days_spent valencia c0)
    (days_spent lyon c0)
    (days_spent split c0)

    ;; Calendar sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)

    ;; Counting sequence
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8)
    (next_count c8 c9) (next_count c9 c10) (next_count c10 c11) (next_count c11 c12)
    (next_count c12 c13) (next_count c13 c14) (next_count c14 c15) (next_count c15 c16)

    ;; Flight network
    (flight valencia lyon) (flight lyon valencia)
    (flight lyon split) (flight split lyon)
  )
  (:goal
    (and
      ;; Total days spent requirements
      (days_spent valencia c5)
      (days_spent lyon c6)
      (days_spent split c7)
      
      ;; Split annual show requirement (Days 10-16)
      (visited split d10)
      (visited split d11)
      (visited split d12)
      (visited split d13)
      (visited split d14)
      (visited split d15)
      (visited split d16)
    )
  )
)