(define (problem meet-margaret-problem)
  (:domain meetings-domain)

  (:objects
    traveler margaret - agent
    Marina-District Pacific-Heights - location
  )

  ;; Time is measured in minutes from midnight.
  ;; - Traveler arrives at Marina District at 09:00 => 540 minutes.
  ;; - Margaret is present at Pacific Heights from 19:00 (1140) to 19:45 (1185).
  ;; These are modeled using timed initial literals so presence is true only during the stated windows.
  (:init
    ;; Numeric counter starts at 0
    (= (total-meetings) 0)

    ;; Timed initial literal: traveler is at Marina-District starting at 540 minutes (09:00).
    (at 540 (at traveler Marina-District))

    ;; Timed initial literals for Margaret's availability window at Pacific-Heights:
    ;; Her presence becomes true at 1140 and is removed at 1185, so any meeting must be fully inside [1140,1185].
    (at 1140 (at margaret Pacific-Heights))
    (at 1185 (not (at margaret Pacific-Heights)))
  )

  ;; Trivial numeric goal to allow metric optimization. The planner will maximize (total-meetings).
  ;; This keeps feasibility as the primary constraint while enabling optimization.
  (:goal (and (>= (total-meetings) 0)))

  ;; Objective: maximize the number of friends met (here encoded as the numeric fluent total-meetings).
  (:metric maximize (total-meetings))

)