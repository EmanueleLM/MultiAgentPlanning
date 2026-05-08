(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates 
    (busy ?p - participant ?t - time_slot)
    (meeting_scheduled)
    (next ?t1 ?t2 - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
      (next ?t1 ?t2)
      (forall (?p - participant)
        (and 
          (not (busy ?p ?t1))
          (not (busy ?p ?t2))
        )
      )
    )
    :effect (meeting_scheduled)
  )
)