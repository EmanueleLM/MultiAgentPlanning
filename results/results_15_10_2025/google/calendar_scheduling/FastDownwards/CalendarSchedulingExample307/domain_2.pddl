(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (scheduled ?t - time)
    (meeting-scheduled)
  )
  (:action schedule
    :parameters (?t - time ?r - person ?s - person ?b - person ?d - person ?re - person ?j - person)
    :precondition (and
      (free ?r ?t)
      (free ?s ?t)
      (free ?b ?t)
      (free ?d ?t)
      (free ?re ?t)
      (free ?j ?t)
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)