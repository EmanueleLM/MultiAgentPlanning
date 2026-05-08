(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    participant 
    time_slot)
  (:predicates 
    (free ?p - participant ?t - time_slot) 
    (meets_preference ?p - participant ?t - time_slot) 
    (meeting_scheduled ?t - time_slot))
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and 
      (free isabella ?t) 
      (free ronald ?t) 
      (free amanda ?t)
      (meets_preference isabella ?t))
    :effect (meeting_scheduled ?t)))