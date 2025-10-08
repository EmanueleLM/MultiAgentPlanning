(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)

  (:constants olivia anna virginia paul - person)

  (:predicates
    (next ?t - time ?t2 - time)
    (busy ?p - person ?t - time)
    (selected ?t - time)
    (chosen)
  )

  (:action select
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (next ?t ?t2)
      (not (chosen))
      (not (busy olivia ?t)) (not (busy olivia ?t2))
      (not (busy anna ?t)) (not (busy anna ?t2))
      (not (busy virginia ?t)) (not (busy virginia ?t2))
      (not (busy paul ?t)) (not (busy paul ?t2))
    )
    :effect (and
      (selected ?t)
      (chosen)
    )
  )
)