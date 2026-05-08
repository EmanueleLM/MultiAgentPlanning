(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person)

  (:predicates
    (at ?ag - agent ?loc - location)        ; agent is at location (unique by action effects)
    (met ?p - person)                       ; friend has been met
    (betty_available ?loc - location)       ; Betty is available at this location (validated)
    (can_meet_betty)                        ; auditor/collector validated a feasible 75-min meeting
    (connected ?from - location ?to - location) ; explicit allowed travel legs
  )

  ;; Explicit travel over declared connections only.
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and
      (at ?ag ?from)
      (connected ?from ?to)
      (not (at ?ag ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  ;; Meeting action for Betty: requires being at a location where she is available
  ;; and the auditor/collector validation that a 75-minute meeting during her window is feasible.
  (:action meet_betty
    :parameters (?ag - agent ?p - person ?loc - location)
    :precondition (and
      (at ?ag ?loc)
      (betty_available ?loc)
      (can_meet_betty)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
    )
  )
)