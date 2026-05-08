(define (domain meeting_scheduler)
  (:requirements :strips :typing)
  (:types participant time)
  (:predicates
    (is_busy ?p - participant ?t1 - time ?t2 - time)
    (free_slot ?t1 - time ?t2 - time)
    (meeting_scheduled ?t1 - time ?t2 - time)
    (next_time ?t1 - time ?t2 - time)
    (consecutive ?t1 - time ?t2 - time)
  )

  (:action schedule_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (free_slot ?t1 ?t2)
      (not (exists (?p - participant) (is_busy ?p ?t1 ?t2)))
      (consecutive ?t1 ?t2)
    )
    :effect 
    (and
      (meeting_scheduled ?t1 ?t2)
      (not (free_slot ?t1 ?t2))
    )
  )
)