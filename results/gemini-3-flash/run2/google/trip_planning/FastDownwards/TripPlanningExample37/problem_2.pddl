(define (problem trip_planning_example_37_prob)
  (:domain trip_planning)
  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Time progression
    (is_day_one day_1)
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    ;; Successor relations for tracking durations
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)

    ;; Direct flight network
    (can_fly reykjavik milan)
    (can_fly milan reykjavik)
    (can_fly milan porto)
    (can_fly porto milan)

    ;; Initial visit counts for all cities
    (visit_count reykjavik n0)
    (visit_count milan n0)
    (visit_count porto n0)
  )
  (:goal
    (and
      ;; Total trip length
      (current_day day_10)

      ;; City-specific stay durations
      (visit_count reykjavik n6)
      (visit_count milan n4)
      (visit_count porto n2)

      ;; Specific time constraints
      (at porto day_9)
      (at porto day_10)
    )
  )
)