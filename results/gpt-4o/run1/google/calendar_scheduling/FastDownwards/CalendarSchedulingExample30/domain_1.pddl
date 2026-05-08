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
                   (not (busy john ?ts))
                   (not (busy virginia ?ts))
                   (not (busy melissa ?ts))
                   (or 
                     (preferred_before_14 melissa)
                     (not (and
                        (busy melissa timeslot_14_0)
                        (busy melissa timeslot_15_0)
                     ))
                   )
                  )
    :effect (meeting_scheduled ?ts)
  )
)