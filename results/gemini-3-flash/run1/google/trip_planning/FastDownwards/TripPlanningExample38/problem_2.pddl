(define (problem trip_planning_example_38_problem)
  (:domain trip_planning_example_38)
  (:objects
    geneva madrid venice - city
    d1 d2 d3 d4 d5 d6 - day
    n0 n1 n2 n3 n4 n5 - count
  )

  (:init
    ;; Initialize trip state
    (current_day d1)
    
    ;; Time progression sequence
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)

    ;; Stay duration counters
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Initialize all stay counts to zero
    (stay_count geneva n0)
    (stay_count madrid n0)
    (stay_count venice n0)

    ;; Flight network connections (bidirectional)
    (flight geneva madrid)
    (flight madrid geneva)
    (flight madrid venice)
    (flight venice madrid)
  )

  (:goal
    (and
      ;; The trip must complete exactly 5 calendar days.
      (current_day d6)

      ;; Specific conference constraint: Must be in Venice on Day 4 and Day 5.
      (day_visited venice d4)
      (day_visited venice d5)

      ;; Explicit stay duration requirements for each city.
      (stay_count venice n2)
      (stay_count geneva n2)
      (stay_count madrid n3)
    )
  )
)