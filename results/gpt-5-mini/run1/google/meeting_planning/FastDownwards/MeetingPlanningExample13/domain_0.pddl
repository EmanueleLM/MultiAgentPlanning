(define (domain itinerary_planner_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person itinerary)

  (:predicates
    (at ?a - agent ?l - location)                ; agent at location (endpoint of an itinerary)
    (met ?p - person)                            ; friend has been met (meeting completed)
    (itinerary-feasible ?i - itinerary)          ; this candidate itinerary is temporally feasible given availability windows
    (itinerary-chosen ?i - itinerary)            ; a chosen itinerary (prevents choosing multiple conflicting itineraries)
  )

  ;-----------------------------------------------------------------
  ; Each action represents one complete, temporally-checked candidate itinerary.
  ; Preconditions encode the strict constraints validated by the availability report:
  ;   - the agent must start at Presidio (09:00),
  ;   - the candidate itinerary must be feasible (itinerary-feasible is provided in the problem init),
  ;   - the friend must not already be met (prevents redundant/contradictory plans).
  ; Effects mark the itinerary as chosen, record that Betty was met, and place the agent at the final location.
  ; These actions are atomic macros that preserve the internal ordered sequence described in each candidate.
  ;-----------------------------------------------------------------

  (:action choose-itinerary-A
    :parameters ()
    :precondition (and
      (at you-agent Presidio)
      (itinerary-feasible itinerary-A)
      (not (met betty-person))
      (not (itinerary-chosen itinerary-A))
    )
    :effect (and
      (itinerary-chosen itinerary-A)
      (met betty-person)
      ;; Candidate A ends at Presidio (return arrival 20:17)
      (at you-agent Presidio)
    )
  )

  (:action choose-itinerary-B
    :parameters ()
    :precondition (and
      (at you-agent Presidio)
      (itinerary-feasible itinerary-B)
      (not (met betty-person))
      (not (itinerary-chosen itinerary-B))
    )
    :effect (and
      (itinerary-chosen itinerary-B)
      (met betty-person)
      ;; Candidate B returns to Presidio at 22:17
      (at you-agent Presidio)
    )
  )

  (:action choose-itinerary-C
    :parameters ()
    :precondition (and
      (at you-agent Presidio)
      (itinerary-feasible itinerary-C)
      (not (met betty-person))
      (not (itinerary-chosen itinerary-C))
    )
    :effect (and
      (itinerary-chosen itinerary-C)
      (met betty-person)
      ;; Candidate C returns to Presidio at 20:17
      (at you-agent Presidio)
    )
  )

  (:action choose-itinerary-D
    :parameters ()
    :precondition (and
      (at you-agent Presidio)
      (itinerary-feasible itinerary-D)
      (not (met betty-person))
      (not (itinerary-chosen itinerary-D))
    )
    :effect (and
      (itinerary-chosen itinerary-D)
      (met betty-person)
      ;; Candidate D returns to Presidio at 20:20
      (at you-agent Presidio)
    )
  )

)