(define (problem trip_planning_example_6_problem)
  (:domain trip_planning_example_6)
  (:objects
    dubrovnik berlin munich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 - count
  )

  (:init
    ;; Conference constraints: Day 1 and Day 4 must be in Berlin.
    (can_visit berlin d1)
    (can_visit berlin d2)
    (can_visit berlin d3)
    (can_visit berlin d4)
    (can_visit berlin d5)
    (can_visit berlin d6)
    (can_visit berlin d7)
    (can_visit berlin d8)
    
    (can_visit munich d2)
    (can_visit munich d3)
    (can_visit munich d5)
    (can_visit munich d6)
    (can_visit munich d7)
    (can_visit munich d8)
    
    (can_visit dubrovnik d2)
    (can_visit dubrovnik d3)
    (can_visit dubrovnik d5)
    (can_visit dubrovnik d6)
    (can_visit dubrovnik d7)
    (can_visit dubrovnik d8)

    ;; Starting location: Berlin (attending conference Day 1)
    (at berlin)
    (current_day d1)

    ;; Initial visit counters
    (visit_count berlin n0)
    (visit_count munich n0)
    (visit_count dubrovnik n0)

    ;; Direct flight connectivity
    (flight munich dubrovnik)
    (flight dubrovnik munich)
    (flight berlin munich)
    (flight munich berlin)

    ;; Temporal sequence
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Counter sequence
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
  )

  (:goal
    (and
      ;; Total trip duration reached (8 days processed)
      (current_day d9)
      ;; Specific city visit requirements
      (visit_count berlin n4)
      (visit_count munich n3)
      (visit_count dubrovnik n3)
    )
  )
)