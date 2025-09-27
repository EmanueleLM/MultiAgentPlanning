(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types participant time)
  (:predicates
    (busy ?p - participant ?t - time)
    (scheduled)
    (scheduled-at ?t - time)
  )
  (:functions
    (time-index ?t - time)
    (chosen-index)
  )

  (:action schedule-at
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (not (busy sara ?t))
      (not (busy sarah ?t))
      (not (busy shirley ?t))
      (not (busy harold ?t))
      (not (busy terry ?t))
    )
    :effect (and
      (scheduled)
      (scheduled-at ?t)
      (assign (chosen-index) (time-index ?t))
    )
  )
)