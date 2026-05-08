(define (problem trip_planning_example9_problem)
  (:domain trip_planning_example9)
  (:objects
    frankfurt bucharest stuttgart - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Starting State
    (at_no_city)
    (current_day d1)
    (is_stuttgart stuttgart)

    ;; City Connections
    (flight bucharest frankfurt)
    (flight frankfurt bucharest)
    (flight frankfurt stuttgart)
    (flight stuttgart frankfurt)

    ;; Day Progression
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6)
    (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11)

    ;; Workshop Schedule (Day 5 to Day 10)
    (is_workshop_day d5) (is_workshop_day d6) (is_workshop_day d7)
    (is_workshop_day d8) (is_workshop_day d9) (is_workshop_day d10)

    ;; Counter Progression
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4) (next_count n4 n5)
    (next_count n5 n6) (next_count n6 n7) (next_count n7 n8) (next_count n8 n9) (next_count n9 n10)

    ;; Initial Counts for All Cities
    (count_at frankfurt n0)
    (count_at bucharest n0)
    (count_at stuttgart n0)
  )
  (:goal (and
    ;; Trip duration: 10 days (completes after action of day 10)
    (current_day d11)
    ;; Required stay counts
    (count_at frankfurt n3)
    (count_at bucharest n3)
    (count_at stuttgart n6)
  ))
)