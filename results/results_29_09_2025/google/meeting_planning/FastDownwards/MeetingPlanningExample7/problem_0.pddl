(define (problem schedule-with-john)
  (:domain meeting-scheduling)
  (:objects
    traveler john - agent
    Richmond_District North_Beach - location
  )

  (:init
    ;; Traveler arrives at Richmond District at 09:00 (540 minutes since midnight)
    (at 540 (at traveler Richmond_District))

    ;; John is available at North Beach from 15:15 (915) to 17:15 (1035)
    (at 915 (at john North_Beach))
    (at 1035 (not (at john North_Beach)))

    ;; initial accumulated meeting time
    (= (total-time) 0)
  )

  ;; Hard requirement: at least 75 minutes of meeting time (with John) must be achieved.
  (:goal (and (>= (total-time) 75)))

  ;; Objective: maximize total meeting time (if other friends were present this would maximize meetings/time)
  (:metric maximize (total-time))
)