(define (domain meeting-schedule)
  (:requirements :strips)
  (:predicates
    (free ?person ?slot)
    (slot-next ?s1 ?s2)
    (meeting-scheduled ?slot)
  )
  (:action schedule
    :parameters (?p1 ?p2 ?p3 ?s1 ?s2)
    :precondition (and
      (slot-next ?s1 ?s2)
      (free ?p1 ?s1) (free ?p1 ?s2)
      (free ?p2 ?s1) (free ?p2 ?s2)
      (free ?p3 ?s1) (free ?p3 ?s2)
    )
    :effect (and
      (meeting-scheduled ?s1)
    )
  )
)