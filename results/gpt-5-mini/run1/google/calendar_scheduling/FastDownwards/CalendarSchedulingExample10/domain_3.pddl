(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (meeting-scheduled))
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (not (free ?p1 ?s))
      (not (free ?p2 ?s))
      (not (free ?p3 ?s))
    )
  )
)