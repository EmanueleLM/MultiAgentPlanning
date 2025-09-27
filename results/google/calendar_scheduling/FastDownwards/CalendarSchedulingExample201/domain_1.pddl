(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :adl :universal-preconditions)
  (:types participant time)
  (:predicates
    (busy ?p - participant ?t - time)
    (available ?t - time)
    (scheduled)
    (scheduled-at ?t - time)
    (before ?t1 - time ?t2 - time)
  )
  (:action schedule-at
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (available ?t)
      (forall (?t2 - time) (imply (before ?t2 ?t) (not (available ?t2))))
    )
    :effect (and
      (scheduled)
      (scheduled-at ?t)
    )
  )
)