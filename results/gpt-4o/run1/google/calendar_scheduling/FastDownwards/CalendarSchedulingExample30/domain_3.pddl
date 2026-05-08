(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates 
    (busy ?p - participant ?ts - timeslot)
    (preferred_before_14 ?p - participant)
    (available ?ts - timeslot)
    (meeting_scheduled ?ts - timeslot)
  )
  
  (:action schedule_meeting
    :parameters (?ts - timeslot)
    :precondition (and 
                   (available ?ts)
                   (not (busy jeffrey ?ts))
                   (not (busy virginia ?ts))
                   (not (busy melissa ?ts))
                   (or 
                     (not (preferred_before_14 melissa))
                     (< (time_of ?ts) 14)
                   )
                  )
    :effect (meeting_scheduled ?ts)
  )
)