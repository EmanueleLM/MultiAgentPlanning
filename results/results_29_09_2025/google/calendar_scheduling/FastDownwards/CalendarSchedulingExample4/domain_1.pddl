(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?a1 - agent ?a2 - agent ?a3 - agent ?s - slot)
    :precondition (and
      (free ?a1 ?s)
      (free ?a2 ?s)
      (free ?a3 ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)