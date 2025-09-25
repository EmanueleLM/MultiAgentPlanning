(define (problem meet-stephanie-problem)
  (:domain multi-agent-meeting)
  (:requirements :durative-actions :typing :timed-initial-literals)

  (:objects
    traveler stephanie - agent
    Chinatown Marina - location
  )

  ;; We treat time 0 in this problem as the traveler's arrival time 09:00.
  ;; Stephanie is available at 09:00 (she is available from 08:00) and stops being available at 15:00,
  ;; which is 360 minutes after this time-0 (09:00 -> 15:00 = 6h = 360min).
  (:init
    ;; initial locations at time 0 (09:00)
    (at traveler Chinatown)
    (at stephanie Marina)

    ;; Stephanie is available at the start (because 08:00 <= 09:00)
    (available stephanie)

    ;; At time 360 (i.e., 15:00), Stephanie is no longer available.
    (at 360 (not (available stephanie)))
  )

  ;; Goal: have completed a meeting of at least 105 minutes between traveler and Stephanie.
  (:goal (met))
)