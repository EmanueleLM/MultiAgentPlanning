(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (attending ?a - agent)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot ?stephen - agent ?elijah - agent ?william - agent ?jeremy - agent ?timothy - agent)
    :precondition (and
      (not (meeting-scheduled))
      (attending ?stephen) (free ?stephen ?s)
      (attending ?elijah) (free ?elijah ?s)
      (attending ?william) (free ?william ?s)
      (attending ?jeremy) (free ?jeremy ?s)
      (attending ?timothy) (free ?timothy ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)