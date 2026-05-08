(define (problem trip_planning_problem_35)
  (:domain trip_planning_example_35)
  (:objects
    bucharest zurich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (current_city bucharest)
    (current_day d1)
    
    ;; Temporal sequence
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ;; Direct flight connections
    (can_fly bucharest zurich)
    (can_fly zurich bucharest)
    (can_fly zurich dubrovnik)
    (can_fly dubrovnik zurich)
  )
  (:goal
    (and
      ;; Ensure the trip lasts for 10 days
      (day_processed d10)

      ;; Visit Bucharest for 3 days (d1, d2, d3)
      (at_city_on_day bucharest d1)
      (at_city_on_day bucharest d2)
      (at_city_on_day bucharest d3)

      ;; Visit Zurich for 2 days (d3, d4)
      (at_city_on_day zurich d3)
      (at_city_on_day zurich d4)

      ;; Visit Dubrovnik for 7 days (d4, d5, d6, d7, d8, d9, d10)
      ;; This specifically fulfills the relative visit between Day 4 and Day 10
      (at_city_on_day dubrovnik d4)
      (at_city_on_day dubrovnik d5)
      (at_city_on_day dubrovnik d6)
      (at_city_on_day dubrovnik d7)
      (at_city_on_day dubrovnik d8)
      (at_city_on_day dubrovnik d9)
      (at_city_on_day dubrovnik d10)
    )
  )
)