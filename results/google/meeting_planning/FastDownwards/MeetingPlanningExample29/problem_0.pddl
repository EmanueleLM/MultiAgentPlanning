(define (problem meet-nancy-problem)
  (:domain multiagent-meetings)
  (:objects
    traveler nancy - agent
    sunset haight - location
  )

  (:init
    ; Traveler arrives in Sunset District at 09:00 = 540 minutes
    (at traveler sunset)

    ; Nancy is not modeled as present until her availability action fires at 1170.
    ; No (at nancy haight) in init to respect her window.

    ; Initial time and counters
    (= (clock) 540)
    (= (met-count) 0)
  )

  ; No hard propositional goal beyond enabling metric optimization;
  ; planner is free to schedule actions to maximize met-count.
  (:goal (and))

  ; Objective: maximize the number of friends met (met-count).
  ; This enforces hard constraints encoded above (Nancy's window and meeting duration).
  (:metric maximize (met-count))
)