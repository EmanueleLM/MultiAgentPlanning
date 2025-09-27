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
    :parameters (?t - time ?d - participant ?h - participant ?a - participant ?e - participant ?b - participant ?deb - participant)
    :precondition (and
      (unscheduled)
      (valid-start ?t)
      (available ?d ?t) (available ?h ?t) (available ?a ?t)
      (available ?e ?t) (available ?b ?t) (available ?deb ?t)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at ?t)
    )
  )
)