(define (problem meeting_planning_problem)
  (:domain meeting_planning)

  (:objects
    you_agent - agent
    betty_person - person

    presidio north_beach - location
  )

  (:init
    ;; Starting condition: you arrive at Presidio at the start of the plan
    (at you_agent presidio)

    ;; Explicit connectivity (only these travel legs are allowed)
    (connected presidio north_beach)
    (connected north_beach presidio)

    ;; Validated availability facts (availability_collector + auditor)
    ;; Betty will be at North Beach between 18:45 and 22:00, and a 75-minute meeting is feasible.
    (betty_available north_beach)
    (can_meet_betty)
  )

  ;; Hard goals for this instance:
  ;; - meet Betty
  ;; - return to Presidio
  (:goal (and
    (met betty_person)
    (at you_agent presidio)
  ))
)