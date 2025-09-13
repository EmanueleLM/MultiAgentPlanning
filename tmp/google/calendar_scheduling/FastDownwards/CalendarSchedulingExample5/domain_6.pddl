(define (domain integrated_schedule_meeting)
  (:requirements :strips :typing :adl)

  (:types person time-slot)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (meeting_scheduled ?t - time-slot)
  )
  
  (:action schedule_meeting_kathryn
    :parameters (?t1 ?t2 - time-slot)
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
      )
    :effect
      (and 
        (meeting_scheduled ?t1)
        (meeting_scheduled ?t2)
      )
  )

  (:action schedule_meeting_charlotte
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available charlotte ?t1)
        (available charlotte ?t2)
        (available kathryn ?t1)
        (available kathryn ?t2)
        (available lauren ?t1)
        (available lauren ?t2)
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

  (:action schedule_meeting_lauren
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available lauren ?t1)
        (available lauren ?t2)
        (available kathryn ?t1)
        (available kathryn ?t2)
        (available charlotte ?t1)
        (available charlotte ?t2)
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