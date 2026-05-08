(define (problem trip_planning_example_19)
  (:domain trip_planning)

  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; Starting location (Nice is chosen to satisfy the early tour window).
    (at nice)
    (current_day d1)

    ;; Direct flight connectivity.
    (connected brussels valencia)
    (connected valencia brussels)
    (connected nice brussels)
    (connected brussels nice)

    ;; Timeline structure for 9 days.
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
  )

  (:goal
    (and
      ;; Nice: 6 days total, specifically between day 1 and 6 for the tour.
      (visited nice d1)
      (visited nice d2)
      (visited nice d3)
      (visited nice d4)
      (visited nice d5)
      (visited nice d6)

      ;; Brussels: 2 days total.
      ;; The only way to fit this into 9 days is to overlap with Nice on day 6.
      (visited brussels d6)
      (visited brussels d7)

      ;; Valencia: 3 days total.
      ;; Overlapping with Brussels on day 7 to complete the 9-day plan.
      (visited valencia d7)
      (visited valencia d8)
      (visited valencia d9)
    )
  )
)