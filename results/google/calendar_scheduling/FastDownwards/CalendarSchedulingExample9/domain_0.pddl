(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available diane ?s)
      (available kelly ?s)
      (available deborah ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)