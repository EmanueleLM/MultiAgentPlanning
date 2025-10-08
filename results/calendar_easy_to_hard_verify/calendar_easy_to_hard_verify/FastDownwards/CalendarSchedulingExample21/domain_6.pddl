(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person ?p4 - person ?p5 - person)
    :precondition (and
      (not (meeting-scheduled))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (free ?p4 ?s)
      (free ?p5 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)