(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant ?p4 - participant ?p5 - participant)
    :precondition (and
      (not (scheduled))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (free ?p4 ?s)
      (free ?p5 ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)