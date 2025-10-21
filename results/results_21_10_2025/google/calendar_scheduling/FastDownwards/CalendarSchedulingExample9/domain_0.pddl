(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (person ?p - person)
    (slot ?s - slot)
  )

  ;; Schedule a 30-minute meeting at a given slot if all three participants are available.
  (:action schedule-meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
      (not (meeting-scheduled ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
    )
  )
)