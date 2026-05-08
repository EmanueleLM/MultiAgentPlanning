(define (problem trip_planning_38_problem)
  (:domain trip_planning_example_38)
  (:objects
    geneva madrid venice - city
    d1 d2 d3 d4 d5 - day
  )
  (:init
    ;; Day structure (5 days total)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)

    ;; Flight routes (bidirectional)
    (can_fly geneva madrid)
    (can_fly madrid geneva)
    (can_fly madrid venice)
    (can_fly venice madrid)

    ;; Starting state: Traveler starts in Geneva on Day 1
    (current_day d1)
    (at geneva)
    (visited geneva d1)
  )
  (:goal
    (and
      ;; The trip must last 5 days
      (current_day d5)

      ;; Conference in Venice on Day 4 and Day 5
      ;; (This also satisfies the goal of staying in Venice for 2 days)
      (visited venice d4)
      (visited venice d5)

      ;; 2 Days in Geneva
      ;; (Using the overlap on day 2 for travel)
      (visited geneva d1)
      (visited geneva d2)

      ;; 3 Days in Madrid
      ;; (Using overlap on days 2 and 4 for travel)
      (visited madrid d2)
      (visited madrid d3)
      (visited madrid d4)
    )
  )
)