(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (free jason ?s)
      (free william ?s)
      (free frances ?s)
      (free rachel ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)