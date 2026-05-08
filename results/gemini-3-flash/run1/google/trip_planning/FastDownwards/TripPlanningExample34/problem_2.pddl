(define (problem trip_planning_34)
  (:domain trip_planning)
  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Temporal adjacency
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; Counting successor logic
    (succ c0 c1) (succ c1 c2) (succ c2 c3) (succ c3 c4) (succ c4 c5)

    ;; City connectivity (bidirectional direct flights)
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)

    ;; Initial traveler state: Starting at Valencia on Day 1
    (at valencia d1)
    (visited valencia d1)
    (stay_count valencia c1)
    
    ;; Initial stay counts for cities not yet reached
    (stay_count frankfurt c0)
    (stay_count florence c0)
  )
  (:goal
    (and
      ;; Stay durations: 5 days in Frankfurt, 4 in Florence, 2 in Valencia
      (stay_count frankfurt c5)
      (stay_count florence c4)
      (stay_count valencia c2)

      ;; Specific constraints: visited relatives in Valencia on Day 1 and Day 2
      (visited valencia d1)
      (visited valencia d2)
    )
  )
)