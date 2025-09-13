(define (domain integrated_schedule_meeting)
  (:requirements :strips :typing :adl)

  (:types person time-slot)
  
  (:predicates
    (available_kathryn ?t - time-slot)
    (available_charlotte ?t - time-slot)
    (available_lauren ?t - time-slot)
    (meeting_scheduled ?t - time-slot)
    (adjacent ?t1 ?t2 - time-slot)
    (before_1330 ?t - time-slot)
  )
  
  (:action schedule_meeting
    :parameters (?t1 ?t2 - time-slot)
    :precondition 
      (and 
        (available_kathryn ?t1)
        (available_kathryn ?t2)
        (available_charlotte ?t1)
        (available_charlotte ?t2)
        (available_lauren ?t1)
        (available_lauren ?t2)
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