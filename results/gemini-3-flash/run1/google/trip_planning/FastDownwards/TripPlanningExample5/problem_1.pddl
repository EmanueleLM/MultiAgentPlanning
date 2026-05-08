(define (problem trip_planning_example_5)
  (:domain trip_planning)
  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting state: Porto on Day 1.
    (at porto d1)
    (count porto c1)
    (count oslo c0)
    (count dubrovnik c0)

    ;; City connections
    (flight oslo dubrovnik)
    (flight dubrovnik oslo)
    (flight porto oslo)
    (flight oslo porto)

    ;; Day progression
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

    ;; Count progression
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
  )
  (:goal (and
    ;; Required stay durations: Oslo (6), Porto (7), Dubrovnik (5).
    (count oslo c6)
    (count porto c7)
    (count dubrovnik c5)
    
    ;; Conference attendance constraints
    (conf_d12_attended)
    (conf_d16_attended)
    
    ;; End state
    (at dubrovnik d16)
  ))
)