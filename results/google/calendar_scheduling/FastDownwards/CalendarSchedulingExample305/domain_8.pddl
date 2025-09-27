(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant time)

  (:predicates
    (available ?p - participant ?t - time)
    (unscheduled)
    (scheduled)
    (meeting-at ?t - time)
    (valid-start ?t - time)
  )

  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      (valid-start ?t)
      (available diane ?t) (available helen ?t) (available arthur ?t)
      (available ethan ?t) (available beverly ?t) (available deborah ?t)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at ?t)
    )
  )
)