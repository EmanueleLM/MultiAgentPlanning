(define (problem trip_planning_example_36)
  (:domain trip_planning)
  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:init
    ;; Starting state
    (at florence)
    (current_day d1)

    ;; Initial stay counts
    (stay_count florence c0)
    (stay_count munich c0)
    (stay_count warsaw c0)

    ;; City connections
    ;; Interpreted from "from Florence to Munich, Munich and Warsaw"
    (flight florence munich)
    (flight munich warsaw)

    ;; Day transitions (for a 13-day trip)
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

    ;; Count transitions
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
  )

  (:goal
    (and
      ;; Visit each city for the required duration
      (stay_count florence c2)
      (stay_count munich c6)
      (stay_count warsaw c7)
      
      ;; Ensure exactly 13 day slots were used
      (current_day d14)
      
      ;; Final arrival
      (at warsaw)
    )
  )
)