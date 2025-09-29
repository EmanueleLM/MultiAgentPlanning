(define (problem meet-jeffrey-optimization)
  (:domain sf_meetings)

  (:objects
    traveler jeffrey - agent
    the_castro golden_gate_park - location
  )

  ; Initial numeric fluent
  (:init
    (= (total-meetings) 0)
  )

  ; Timed initial literals encode:
  ; - Jeffrey is at Golden Gate Park from 07:00 (420) to 17:30 (1050)
  ; - Traveler arrives at The Castro at 09:00 (540)
  ; Times are given in minutes from midnight.
  (:timed-initial-literals
    ; Jeffrey becomes present at Golden Gate Park at 07:00 (420)
    (at 420 (at jeffrey golden_gate_park))
    ; Jeffrey leaves availability at 17:30 (1050) -> remove the predicate
    (at 1050 (not (at jeffrey golden_gate_park)))

    ; Traveler arrives at The Castro at 09:00 (540)
    (at 540 (at traveler the_castro))
  )

  ; Trivial goal (planner will optimize metric). The goal is satisfiable immediately;
  ; optimization metric drives the planner to schedule meetings if possible.
  (:goal (and (>= (total-meetings) 0)))

  ; Objective: maximize the number of meetings with Jeffrey
  (:metric maximize (total-meetings))
)