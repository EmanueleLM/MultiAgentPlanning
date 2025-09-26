(define (domain meeting-scheduling)
  (:requirements :strips)
  (:predicates
    (available ?person ?time)
    (next ?t1 ?t2)
    (meeting-scheduled ?start)
  )

  (:action schedule
    :parameters (?s ?s2)
    :precondition (and
      (next ?s ?s2)
      (available michelle ?s) (available michelle ?s2)
      (available steven ?s)  (available steven ?s2)
      (available jerry ?s)   (available jerry ?s2)
    )
    :effect (and
      (meeting-scheduled ?s)
    )
  )
)