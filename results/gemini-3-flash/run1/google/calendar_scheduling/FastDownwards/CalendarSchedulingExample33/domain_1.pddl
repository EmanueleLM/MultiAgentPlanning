(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (next ?t1 - time ?t2 - time)
    (available ?p - person ?t - time)
    (meeting_is_scheduled)
  )

  (:action schedule_30min
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (next ?t1 ?t2)
      (available lisa ?t1)
      (available bobby ?t1)
      (available randy ?t1)
    )
    :effect (and
      (meeting_is_scheduled)
    )
  )
)