(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person)

  (:predicates
    (at ?ag - agent ?loc - location)       ; agent located at location
    (met ?p - person)                      ; friend has been met
    (betty_available ?loc - location)      ; Betty is available at this location (validated)
    (can_meet_betty)                       ; auditor/collector validated meeting feasibility (duration & travel)
  )

  ;; Explicit travel action between connected locations.
  ;; Travel durations are not modeled numerically here; feasibility (considering travel times)
  ;; is recorded as the can_meet_betty fact in the problem init (validated by the availability/auditor).
  (:action travel
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and
      (at ?ag ?from)
      (not (at ?ag ?to))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  ;; Meeting action for Betty at a location where she is available and feasibility was validated.
  ;; The meeting consumes no numeric time in this classical model; the (can_meet_betty) fact
  ;; encodes that a 75-minute meeting during Betty's window is feasible given travel durations.
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