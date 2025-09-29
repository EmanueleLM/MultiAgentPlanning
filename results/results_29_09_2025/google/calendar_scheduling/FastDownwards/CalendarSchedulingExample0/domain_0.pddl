(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?t)
    (next ?t ?t2)
    (participant ?p)
    (free ?p ?t)
    (meeting ?m)
    (meeting-at ?m ?t)
  )

  (:action schedule-meeting
    :parameters (?m ?t ?t2 ?p1 ?p2 ?p3)
    :precondition (and
      (meeting ?m)
      (slot ?t) (slot ?t2)
      (next ?t ?t2)
      (participant ?p1) (participant ?p2) (participant ?p3)
      (free ?p1 ?t) (free ?p1 ?t2)
      (free ?p2 ?t) (free ?p2 ?t2)
      (free ?p3 ?t) (free ?p3 ?t2)
    )
    :effect (and
      (meeting-at ?m ?t)
    )
  )
)