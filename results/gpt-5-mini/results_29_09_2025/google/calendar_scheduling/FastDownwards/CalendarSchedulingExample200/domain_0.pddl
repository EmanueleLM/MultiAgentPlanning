(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)        ; person is free for a 30-min slot starting at time
    (slot-free ?t - time)               ; all participants are free at this time
    (earliest-slot ?t - time)           ; the chosen earliest feasible slot
    (scheduled ?t - time)               ; meeting scheduled at time
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?t - time)
    :precondition (and (slot-free ?t) (earliest-slot ?t))
    :effect (and (scheduled ?t) (meeting-scheduled))
  )
)