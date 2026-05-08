(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot meeting)
  (:predicates 
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?m - meeting ?t - time_slot)
    (prefers_before ?p - participant ?t - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?m - meeting ?t - time_slot)
    :precondition (and 
      (available roy ?t)
      (available kathryn ?t)
      (available amy ?t)
      (not (prefers_before amy ?t))
    )
    :effect 
      (meeting_scheduled ?m ?t)
  )
)