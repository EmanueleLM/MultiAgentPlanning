(define (domain scheduling)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    participant
    timeslot
  )
  
  (:predicates
    (free ?p - participant ?t - timeslot)
    (meeting_scheduled)
  )
  
  (:action ScheduleMeeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t1 - timeslot ?t2 - timeslot)
    :precondition (and 
                    (free ?p1 ?t1) 
                    (free ?p1 ?t2) 
                    (free ?p2 ?t1) 
                    (free ?p2 ?t2) 
                    (free ?p3 ?t1) 
                    (free ?p3 ?t2)
                    (not (meeting_scheduled)))
    :effect (meeting_scheduled)
  )
)