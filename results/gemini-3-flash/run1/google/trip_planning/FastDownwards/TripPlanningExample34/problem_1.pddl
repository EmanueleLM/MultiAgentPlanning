(define (problem trip_planning_problem)
  (:domain trip_planning_domain)
  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Temporal structure
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; Counting structure
    (succ c0 c1) (succ c1 c2) (succ c2 c3) (succ c3 c4) (succ c4 c5)

    ;; Direct flights (bidirectional)
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)
  )
  (:goal
    (and
      ;; Total trip days spent in each city
      (count_frankfurt c5)
      (count_florence c4)
      (count_valencia c2)

      ;; Specific constraint: relative visit in Valencia between Day 1 and Day 2
      (visited valencia d1)
      (visited valencia d2)
    )
  )
)