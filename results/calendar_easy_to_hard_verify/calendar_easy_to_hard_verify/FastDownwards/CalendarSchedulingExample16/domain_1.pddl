(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)

  (:predicates
    (next ?t ?t2 - time)
    (busy ?p - person ?t - time)
    (selected ?t - time)
    (chosen)
  )

  (:action select
    :parameters (?t ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (chosen))
      (not (busy Olivia ?t)) (not (busy Olivia ?t2))
      (not (busy Anna ?t)) (not (busy Anna ?t2))
      (not (busy Virginia ?t)) (not (busy Virginia ?t2))
      (not (busy Paul ?t)) (not (busy Paul ?t2))
    )
    :effect (and
      (selected ?t)
      (chosen)
    )
  )
)