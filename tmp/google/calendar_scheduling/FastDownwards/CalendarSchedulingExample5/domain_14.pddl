(define (domain integrated_schedule_meeting)
  (:requirements :strips :typing :adl)

  (:types person time-slot)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (meeting_scheduled ?t - time-slot)
    (adjacent ?t1 ?t2 - time-slot)
    (before_1330 ?t - time-slot)
  )
  
  (:action schedule_meeting_kathryn
    :parameters (?p1 - person ?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available kathryn ?t1)
        (available kathryn ?t2)
        (available ?p1 ?t1)
        (available ?p1 ?t2)
        (not (meeting_scheduled ?t1))
        (not (meeting_scheduled ?t2))
        (adjacent ?t1 ?t2)
      )
    :effect
      (and 
        (meeting_scheduled ?t1)
        (meeting_scheduled ?t2)
      )
  )
  
  (:action schedule_meeting_charlotte
    :parameters (?p1 - person ?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available charlotte ?t1)
        (available charlotte ?t2)
        (available ?p1 ?t1)
        (available ?p1 ?t2)
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
  
  (:action schedule_meeting_lauren
    :parameters (?p1 - person ?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available lauren ?t1)
        (available lauren ?t2)
        (available ?p1 ?t1)
        (available ?p1 ?t2)
        (not (meeting_scheduled ?t1))
        (not (meeting_scheduled ?t2))
        (adjacent ?t1 ?t2)
      )
    :effect
      (and 
        (meeting_scheduled ?t1)
        (meeting_scheduled ?t2)
      )
  )
)