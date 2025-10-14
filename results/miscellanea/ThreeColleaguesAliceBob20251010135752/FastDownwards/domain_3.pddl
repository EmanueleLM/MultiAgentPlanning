(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (all-available ?s - slot)
    (preferred-slot ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-set)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-set))
      (all-available ?s)
      (preferred-slot ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-set)
    )
  )
)