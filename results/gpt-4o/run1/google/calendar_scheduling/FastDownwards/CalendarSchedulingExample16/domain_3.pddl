(define (domain meeting_scheduler)
  (:requirements :strips :typing)
  (:types participant time)
  (:predicates
    (is_busy ?p - participant ?t - time)
    (available ?t - time)
    (meeting_scheduled ?t1 - time ?t2 - time)
    (next_time ?t1 - time ?t2 - time)
  )

  (:action schedule_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (next_time ?t1 ?t2)
      (available ?t1)
      (available ?t2)
      (not (exists (?p - participant) (is_busy ?p ?t1)))
      (not (exists (?p - participant) (is_busy ?p ?t2)))
    )
    :effect (meeting_scheduled ?t1 ?t2)
  )
)