(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (seq4 ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    (meeting_scheduled)
  )

  (:action schedule
    :parameters (?p1 ?p2 ?p3 - person ?s1 ?s2 ?s3 ?s4 - slot)
    :precondition (and
      (seq4 ?s1 ?s2 ?s3 ?s4)
      (free ?p1 ?s1) (free ?p1 ?s2) (free ?p1 ?s3) (free ?p1 ?s4)
      (free ?p2 ?s1) (free ?p2 ?s2) (free ?p2 ?s3) (free ?p2 ?s4)
      (free ?p3 ?s1) (free ?p3 ?s2) (free ?p3 ?s3) (free ?p3 ?s4)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)