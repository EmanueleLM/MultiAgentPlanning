(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions)
  (:types person time)

  (:predicates
    (available ?p - person ?t - time)
    (next ?t1 - time ?t2 - time)
    (bob_avoid ?t - time)
    (meeting_scheduled ?t - time)
    (scheduled)
  )

  ;; Alice initiates scheduling
  (:action alice-schedule
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (available alice ?t) (available alice ?t2)
      (available bob ?t) (available bob ?t2)
      (available carol ?t) (available carol ?t2)
      (not (bob_avoid ?t))
      (not (scheduled))
    )
    :effect (and
      (meeting_scheduled ?t)
      (scheduled)
    )
  )

  ;; Bob initiates scheduling
  (:action bob-schedule
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (available alice ?t) (available alice ?t2)
      (available bob ?t) (available bob ?t2)
      (available carol ?t) (available carol ?t2)
      (not (bob_avoid ?t))
      (not (scheduled))
    )
    :effect (and
      (meeting_scheduled ?t)
      (scheduled)
    )
  )

  ;; Carol initiates scheduling
  (:action carol-schedule
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (available alice ?t) (available alice ?t2)
      (available bob ?t) (available bob ?t2)
      (available carol ?t) (available carol ?t2)
      (not (bob_avoid ?t))
      (not (scheduled))
    )
    :effect (and
      (meeting_scheduled ?t)
      (scheduled)
    )
  )
)