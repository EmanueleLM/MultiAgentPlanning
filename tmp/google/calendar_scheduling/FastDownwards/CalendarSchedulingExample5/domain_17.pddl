(define (domain integrated_schedule_meeting)
  (:requirements :strips :typing :adl)

  (:types person time-slot)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (meeting_scheduled ?t - time-slot)
    (adjacent ?t1 ?t2 - time-slot)
    (before_1330 ?t - time-slot)
  )
  
  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - person ?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available kathryn ?t1)
        (available kathryn ?t2)
        (available charlotte ?t1)
        (available charlotte ?t2)
        (available lauren ?t1)
        (available lauren ?t2)
        (not (meeting_scheduled ?t1))
        (not (meeting_scheduled ?t2))
        (adjacent ?t1 ?t2)
        (before_1330 ?t1)
      )
    :effect
      (and 
        (meeting_scheduled ?t1)
        (meeting_scheduled ?t2)
      )
  )
)