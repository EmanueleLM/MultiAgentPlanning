(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    participant 
    day 
    start_time)
  (:predicates 
    (free ?p - participant ?t - start_time) 
    (meets_preference ?p - participant ?t - start_time) 
    (meeting_scheduled ?t - start_time))
  (:action schedule_meeting
    :parameters (?t - start_time)
    :precondition (and 
      (free isabella ?t) 
      (free ronald ?t) 
      (free amanda ?t)
      (meets_preference isabella ?t))
    :effect (meeting_scheduled ?t)))