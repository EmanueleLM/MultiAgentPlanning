(define (problem meet-james)
  (:domain meeting-scheduling)
  (:objects
    visitor james - agent
    golden-gate-park marina - location
  )
  ;; Time origin: 0 = 09:00
  (:init
    ;; Visitor arrives at Golden Gate Park at 09:00 (time 0)
    (at visitor golden-gate-park)

    ;; James will be at Marina from 10:15 to 13:30.
    ;; 10:15 is 75 minutes after 09:00, 13:30 is 270 minutes after 09:00.
    (at 75 (at james marina))
    (at 270 (not (at james marina)))
  )

  ;; Goal: visitor and James have met for at least 15 minutes (we mark completion with (met)).
  (:goal (met))

  ;; Optimize schedule: minimize total time to reach the goal (end time of the plan).
  (:metric minimize (total-time))
)