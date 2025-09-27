(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (participant ?p)
    (available ?p ?s)
    (allowed ?s)
    (scheduled ?s)
  )
  (:action schedule-meeting
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (allowed ?s)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)