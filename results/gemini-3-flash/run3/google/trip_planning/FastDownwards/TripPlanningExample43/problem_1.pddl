(define (problem trip_planning_43_prob)
  (:domain trip_planning_example_43)
  (:objects
    venice dublin porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - count
  )

  (:init
    ;; Initial location and time
    (at venice)
    (current_day d1)

    ;; Day progression (10 days total, finishing at d11)
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

    ;; City connections
    (flight dublin porto)
    (flight porto dublin)
    (flight venice dublin)
    (flight dublin venice)

    ;; Visit counters
    (visit_count venice c0)
    (visit_count dublin c0)
    (visit_count porto c0)

    ;; Counter progression
    (successor c0 c1)
    (successor c1 c2)
    (successor c2 c3)
    (successor c3 c4)
    (successor c4 c5)
    (successor c5 c6)
    (successor c6 c7)
    (successor c7 c8)
    (successor c8 c9)
    (successor c9 c10)

    ;; Minimum stay thresholds (4 days)
    (at_least_4 c4)
    (at_least_4 c5)
    (at_least_4 c6)
    (at_least_4 c7)
    (at_least_4 c8)
    (at_least_4 c9)
    (at_least_4 c10)
  )

  (:goal
    (and
      ;; 10 days trip duration accounted for
      (current_day d11)
      
      ;; 4 days in Venice, specifically including days 1 through 4
      (satisfied venice)
      (visited venice d1)
      (visited venice d2)
      (visited venice d3)
      (visited venice d4)

      ;; 4 days in Dublin
      (satisfied dublin)

      ;; 4 days in Porto
      (satisfied porto)
    )
  )
)