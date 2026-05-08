(define (domain scheduling_meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant time_slot)
  (:predicates 
    (available ?p - participant ?s - time_slot)
    (meeting_scheduled ?s - time_slot))
  
  (:action schedule_meeting
    :parameters (?s - time_slot)
    :precondition (and
      (available david ?s)
      (available debra ?s)
      (available kevin ?s)
      (not (meeting_scheduled ?s)))
    :effect (meeting_scheduled ?s))
)