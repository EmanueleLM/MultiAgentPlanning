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

    ;; Public / validated availability facts:
    ;; Betty will be at North Beach between 18:45 and 22:00, and the availability collector
    ;; together with the auditor validated that a 75-minute meeting is feasible given travel.
    (betty_available north_beach)
    (can_meet_betty)
  )

  ;; Hard goals for this instance:
  ;; - meet Betty
  ;; - end back at Presidio
  (:goal (and
    (met betty_person)
    (at you_agent presidio)
  ))
)