(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)