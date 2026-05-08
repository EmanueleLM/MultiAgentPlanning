(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates 
    (busy ?p - participant ?t - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t1 - time_slot ?t2 - time_slot)
    :precondition (and 
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