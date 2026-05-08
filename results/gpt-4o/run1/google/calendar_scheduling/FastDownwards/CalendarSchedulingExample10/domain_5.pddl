(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_held)
  )
  
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available diana ?t)
      (available ethan ?t)
      (available janet ?t)
      (not (meeting_held))
    )
    :effect (meeting_held)
  )
)