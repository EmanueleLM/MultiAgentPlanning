(define (problem schedule-integration-problem)
  (:domain schedule-integration)
  (:objects
    russian_hill golden_gate_park - location
  )

  (:init
    ;; starting location and times:
    (at russian_hill)
    (= (current-time) 540)   ;; arrive at Russian Hill at 09:00 = 540 minutes
    (= (meeting-start) 0)
    (= (meeting-end) 0)
    (= (friends-met) 0)
  )

  ;; Require at least one feasible verification for a schedule to be considered a solution.
  ;; The metric will maximize the verified friends-met count.
  (:goal (feasible-john))

  ;; Maximize the number of friends verified as met (feasible schedules).
  (:metric maximize (friends-met))
)