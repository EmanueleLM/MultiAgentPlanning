(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (meeting-scheduled))
      (free ?p1 ?s) (free ?p1 ?s2)
      (free ?p2 ?s) (free ?p2 ?s2)
      (free ?p3 ?s) (free ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)