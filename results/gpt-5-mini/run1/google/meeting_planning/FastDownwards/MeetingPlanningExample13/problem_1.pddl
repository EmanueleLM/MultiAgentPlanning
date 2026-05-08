(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)

  (:objects
    you_agent - agent
    betty_person - person

    presidio north_beach - location

    itinerary_a itinerary_b itinerary_c itinerary_d - itinerary
  )

  (:init
    ;; Starting condition: you arrive at Presidio at the start of the plan
    (at you_agent presidio)

    ;; The availability collector / auditor validated these candidate itineraries
    ;; as temporally feasible with respect to Betty's hard window (18:45–22:00)
    ;; and the fixed travel durations. These flags are instance-specific facts.
    (itinerary_feasible itinerary_a)
    (itinerary_feasible itinerary_b)
    (itinerary_feasible itinerary_c)
    (itinerary_feasible itinerary_d)
  )

  ;; Hard goals for this instance:
  ;; - meet Betty (we want to maximize friends met; with only Betty, require meeting her)
  ;; - end back at Presidio as specified by the candidate itineraries
  (:goal (and
    (met betty_person)
    (at you_agent presidio)
  ))
)