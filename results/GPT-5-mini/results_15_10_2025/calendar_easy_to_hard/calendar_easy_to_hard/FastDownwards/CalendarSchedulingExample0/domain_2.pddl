(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (adjacent ?t1 - time ?t2 - time)
    (attending ?p - person ?t - time)
    (meeting-at ?t - time)
    (meeting-scheduled)
  )

  (:action attend
    :parameters (?p - person ?t - time ?t2 - time)
    :precondition (and (adjacent ?t ?t2) (free ?p ?t) (free ?p ?t2))
    :effect (and (attending ?p ?t) (attending ?p ?t2) (not (free ?p ?t)) (not (free ?p ?t2)))
  )

  (:action finalize-meeting
    :parameters (?t - time ?t2 - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (adjacent ?t ?t2)
      (attending ?p1 ?t) (attending ?p1 ?t2)
      (attending ?p2 ?t) (attending ?p2 ?t2)
      (attending ?p3 ?t) (attending ?p3 ?t2)
    )
    :effect (and (meeting-at ?t) (meeting-scheduled))
  )
)