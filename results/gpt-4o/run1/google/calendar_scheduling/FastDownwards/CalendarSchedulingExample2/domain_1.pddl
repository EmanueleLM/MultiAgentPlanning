(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot meeting)
  (:predicates 
    (available ?p - participant ?t - time_slot)
    (meeting_scheduled ?m - meeting ?t1 - time_slot)
    (not_before_preference ?p - participant ?t - time_slot)
  )
  
  (:action schedule_meeting
    :parameters (?m - meeting ?t - time_slot)
    :precondition (and 
      (available roy ?t)
      (available kathryn ?t)
      (available amy ?t)
      (not (not_before_preference amy ?t))
    )
    :effect 
      (meeting_scheduled ?m ?t)
  )
)