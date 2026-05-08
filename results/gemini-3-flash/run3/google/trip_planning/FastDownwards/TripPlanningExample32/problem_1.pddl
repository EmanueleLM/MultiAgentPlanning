(define (problem trip_planning_example_32)
  (:domain trip_planning)
  (:objects
    reykjavik riga paris - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Starting conditions
    (at riga)
    (current_day d1)
    (can_fly_today)

    ;; Initial city counts
    (city_count riga n0)
    (city_count paris n0)
    (city_count reykjavik n0)

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

    ;; Counting progression
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Show calendar in Reykjavik
    (show_day d6)
    (show_day d7)
    (show_day d8)
    (show_day d9)
    (show_day d10)

    ;; Flight network
    (can_fly riga paris)
    (can_fly paris riga)
    (can_fly paris reykjavik)
    (can_fly reykjavik paris)
  )
  (:goal
    (and
      ;; Total stay requirements
      (city_count riga n3)
      (city_count paris n4)
      (city_count reykjavik n5)

      ;; Show attendance requirements
      (attended d6)
      (attended d7)
      (attended d8)
      (attended d9)
      (attended d10)
    )
  )
)