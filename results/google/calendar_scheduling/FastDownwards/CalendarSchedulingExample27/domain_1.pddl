(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions :typing)
  (:types agent slot)
  (:constants jesse kathryn megan - agent)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free jesse ?s)
      (free kathryn ?s)
      (free megan ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)