(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?p1 ?p2 ?p3 - person ?s - slot)
    :precondition (and
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)