(define (problem meet-kenneth-problem)
  (:domain scheduling-domain)
  (:objects
    traveler kenneth - person
    fishermans-wharf nob-hill - location
  )
  (:init
    ;; initial location and presence
    (at traveler fishermans-wharf)
    (at kenneth nob-hill)

    ;; initial time = 09:00 = 540 minutes
    (= (time) 540)

    ;; initial aggregated cost = 0
    (= (total-cost) 0)

    ;; no meeting time yet
    (= (kenneth-met-duration) 0)
  )

  ;; Goal: meet Kenneth for at least 90 minutes (hard constraint).
  ;; The planner must satisfy this. Additional optimization objective is provided below.
  (:goal (and
    (>= (kenneth-met-duration) 90)
  ))

  ;; Optimization: minimize total-cost, where total-cost accumulates travel time (positive)
  ;; and subtracts meeting duration (negative contribution) to prefer longer Kenneth meetings.
  (:metric minimize (total-cost))
)