(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (free ?person ?time)
    (next ?t1 ?t2)
    (scheduled ?time)
  )

  (:action schedule
    :parameters (?t1 ?t2)
    :precondition (and
      (next ?t1 ?t2)
      (free michelle ?t1) (free michelle ?t2)
      (free steven ?t1)  (free steven ?t2)
      (free jerry ?t1)   (free jerry ?t2)
    )
    :effect (and (scheduled ?t1))
  )
)