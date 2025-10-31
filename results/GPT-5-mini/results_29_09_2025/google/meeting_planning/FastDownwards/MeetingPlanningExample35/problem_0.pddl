(define (problem schedule-traveler-jason)
  (:domain multi-agent-scheduling)
  (:objects bayview chinatown - location)
  (:init
    ;; Jason's availability: 08:30 (8.5) to 12:30 (12.5)
    (at 8.5 (jason-available))
    (at 12.5 (not (jason-available)))

    ;; Traveler arrives at Bayview at 09:00 (9.0). Before 9.0 no traveler-at facts are asserted.
    (at 9.0 (traveler-at bayview))
    (at 9.0 (traveler-free))

    ;; Start with zero friends met.
    (= (num-met) 0)
  )
  ;; Require meeting Jason for at least 90 minutes (enforced by durative-action duration constraint);
  ;; the planner will schedule this meeting during Jason's availability window and after traveler's arrival.
  (:goal (met-jason))

  ;; Objective: prefer meeting the maximum number of friends (numeric counter num-met).
  (:metric maximize (num-met))
)