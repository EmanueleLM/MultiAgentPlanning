(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s - slot ?s2 - slot)
    :precondition (and
                    (not (meeting-scheduled))
                    (next ?s ?s2)
                    (free ?p1 ?s) (free ?p1 ?s2)
                    (free ?p2 ?s) (free ?p2 ?s2)
                    (free ?p3 ?s) (free ?p3 ?s2))
    :effect (and (meeting-scheduled) (scheduled ?s))
  )
)