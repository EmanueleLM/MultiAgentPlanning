(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time)
  
  (:predicates
    (available ?p - participant ?t1 - time ?t2 - time)
    (scheduled ?t1 - time ?t2 - time)
    (not_meeting ?p - participant ?t1 - time ?t2 - time)
  )
  
  (:action schedule_meeting
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (available joyce ?t1 ?t2)
                       (available christine ?t1 ?t2)
                       (available alexander ?t1 ?t2)
                       (not (scheduled ?t1 ?t2)))
    :effect (scheduled ?t1 ?t2)
  )
)