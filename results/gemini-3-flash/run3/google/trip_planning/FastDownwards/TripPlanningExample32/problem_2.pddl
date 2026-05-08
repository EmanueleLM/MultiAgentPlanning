(define (problem trip_planning_example_32)
  (:domain trip_planning)
  (:objects
    reykjavik riga paris - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Initial status: Starting at Riga on Day 1
    (at riga)
    (current_day d1)
    (can_fly_today)

    ;; Initial stay counts for all cities
    (stay_count riga n0)
    (stay_count paris n0)
    (stay_count reykjavik n0)

    ;; Day sequence (10 days total)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    ;; Stay count progression (up to 5 days)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Direct flight network
    (can_fly riga paris)
    (can_fly paris riga)
    (can_fly paris reykjavik)
    (can_fly reykjavik paris)

    ;; Show schedule in Reykjavik (Days 6 to 10)
    (show_at reykjavik d6)
    (show_at reykjavik d7)
    (show_at reykjavik d8)
    (show_at reykjavik d9)
    (show_at reykjavik d10)
  )
  (:goal
    (and
      ;; Visit requirements
      (stay_count riga n3)      ;; 3 days in Riga
      (stay_count paris n4)     ;; 4 days in Paris
      (stay_count reykjavik n5) ;; 5 days in Reykjavik

      ;; Show attendance requirements
      (attended d6)
      (attended d7)
      (attended d8)
      (attended d9)
      (attended d10)
    )
  )
)