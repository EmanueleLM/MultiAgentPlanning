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
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free stephen ?s)
      (free elijah ?s)
      (free william ?s)
      (free jeremy ?s)
      (free timothy ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)