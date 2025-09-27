(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (acceptable ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (free nicholas ?s)
      (free emma ?s)
      (free catherine ?s)
      (free steven ?s)
      (free adam ?s)
      (free lori ?s)
      (acceptable ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)