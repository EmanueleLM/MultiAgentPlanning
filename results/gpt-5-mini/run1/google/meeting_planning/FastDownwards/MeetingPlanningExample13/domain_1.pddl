(define (domain meeting_planning_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person itinerary)

  (:predicates
    (at ?a - agent ?l - location)                ; agent at location
    (met ?p - person)                            ; friend has been met
    (itinerary_feasible ?i - itinerary)          ; candidate itinerary validated as temporally feasible
    (itinerary_chosen ?i - itinerary)            ; itinerary has been chosen/executed
  )

  ;; Each "choose_itinerary_X" action is an atomic macro representing one complete,
  ;; temporally-validated candidate itinerary for this specific instance.
  ;; Preconditions require the planner to be at the start location and the itinerary
  ;; to be marked feasible in the problem init. Effects mark the friend as met,
  ;; record the chosen itinerary, and place the planner at the declared final location.
  (:action choose_itinerary_a
    :parameters ()
    :precondition (and
      (at you_agent presidio)
      (itinerary_feasible itinerary_a)
      (not (met betty_person))
      (not (itinerary_chosen itinerary_a))
    )
    :effect (and
      (itinerary_chosen itinerary_a)
      (met betty_person)
      (at you_agent presidio)
    )
  )

  (:action choose_itinerary_b
    :parameters ()
    :precondition (and
      (at you_agent presidio)
      (itinerary_feasible itinerary_b)
      (not (met betty_person))
      (not (itinerary_chosen itinerary_b))
    )
    :effect (and
      (itinerary_chosen itinerary_b)
      (met betty_person)
      (at you_agent presidio)
    )
  )

  (:action choose_itinerary_c
    :parameters ()
    :precondition (and
      (at you_agent presidio)
      (itinerary_feasible itinerary_c)
      (not (met betty_person))
      (not (itinerary_chosen itinerary_c))
    )
    :effect (and
      (itinerary_chosen itinerary_c)
      (met betty_person)
      (at you_agent presidio)
    )
  )

  (:action choose_itinerary_d
    :parameters ()
    :precondition (and
      (at you_agent presidio)
      (itinerary_feasible itinerary_d)
      (not (met betty_person))
      (not (itinerary_chosen itinerary_d))
    )
    :effect (and
      (itinerary_chosen itinerary_d)
      (met betty_person)
      (at you_agent presidio)
    )
  )
)