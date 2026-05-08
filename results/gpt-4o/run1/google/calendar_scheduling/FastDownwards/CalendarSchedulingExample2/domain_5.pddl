(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot meeting)
  (:predicates 
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?m - meeting ?t - time_slot)
    (prefers_before ?p - participant ?t - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?m - meeting ?p1 ?p2 ?p3 - participant ?t - time_slot)
    :precondition (and 
      (available ?p1 ?t)
      (available ?p2 ?t)
      (available ?p3 ?t)
      (not (prefers_before amy ?t))
    )
    :effect 
      (meeting_scheduled ?m ?t)
  )
)