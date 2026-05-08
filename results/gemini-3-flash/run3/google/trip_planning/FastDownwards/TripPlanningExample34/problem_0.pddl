(define (problem trip_plan_9days)
  (:domain trip_planner)
  (:objects 
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Starting location (inferred as Valencia to meet the Day 1 constraint)
    (at valencia)
    (day_at d1)

    ;; Initial counters for city stays
    (count frankfurt c0)
    (count florence c0)
    (count valencia c0)

    ;; Temporal ordering
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    ;; Counter successor relation
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Direct flights connectivity (bidirectional)
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)

    ;; Self-loops for staying in the same city
    (connected frankfurt frankfurt)
    (connected florence florence)
    (connected valencia valencia)
  )
  (:goal
    (and 
      ;; 9 days must be completed
      (day_at d10)
      
      ;; Stay requirements (Total: 5 + 4 + 2 = 11 days, which exceeds the 9-day timeline)
      (count frankfurt c5)
      (count florence c4)
      (count valencia c2)
      
      ;; Specific temporal constraints for relatives in Valencia
      (visited_on d1 valencia)
      (visited_on d2 valencia)
    )
  )
)