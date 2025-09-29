(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (free donna ?s)
      (free john ?s)
      (free billy ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)