(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (meeting-at ?t - time)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?t - time ?t2 - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (adjacent ?t ?t2)
      (free ?p1 ?t) (free ?p1 ?t2)
      (free ?p2 ?t) (free ?p2 ?t2)
      (free ?p3 ?t) (free ?p3 ?t2)
    )
    :effect (and
      (meeting-at ?t)
      (meeting-scheduled)
    )
  )
)