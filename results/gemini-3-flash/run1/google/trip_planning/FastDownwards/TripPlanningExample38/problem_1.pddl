(define (problem trip_planning_example_38_problem)
  (:domain trip_planning_example_38)
  (:objects
    geneva madrid venice - city
    d1 d2 d3 d4 d5 d6 - day
    n0 n1 n2 n3 - count
  )

  (:init
    ;; Days sequence for a 5-day trip. d6 is the state after day 5.
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (current_day d1)

    ;; Counters for stay duration.
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)

    ;; Initialize all stay counts to zero.
    (stay_count geneva n0)
    (stay_count madrid n0)
    (stay_count venice n0)

    ;; Direct flight connections (bidirectional as per "between cities").
    (flight geneva madrid)
    (flight madrid geneva)
    (flight madrid venice)
    (flight venice madrid)
  )

  (:goal
    (and
      ;; The trip must complete 5 days.
      (current_day d6)

      ;; Specifically attend the conference in Venice on Day 4 and Day 5.
      (day_visited venice d4)
      (day_visited venice d5)

      ;; Total stay durations required.
      (stay_count venice n2)
      (stay_count geneva n2)
      (stay_count madrid n3)
    )
  )
)