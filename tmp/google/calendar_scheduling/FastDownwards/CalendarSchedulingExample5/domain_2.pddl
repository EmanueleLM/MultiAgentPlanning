(define (domain integrated_schedule_meeting)
  (:requirements :strips :typing)
  
  (:types person time-slot)
  
  (:predicates
    (available ?p - person ?t - time-slot)
    (meeting_scheduled ?t - time-slot)
  )
  
  (:action schedule_meeting_kathryn
    :parameters (?t - time-slot)
    :precondition 
      (and 
        (available kathryn ?t)
        (available charlotte ?t)
        (available lauren ?t)
        (not (meeting_scheduled ?t))
      )
    :effect
      (meeting_scheduled ?t)
  )

  (:action schedule_meeting_charlotte
    :parameters (?t - time-slot)
    :precondition 
      (and 
        (available charlotte ?t)
        (available kathryn ?t)
        (available lauren ?t)
        (not (meeting_scheduled ?t))
        (not (and (meeting_scheduled ts-13-30) (meeting_scheduled ts-14-00) (meeting_scheduled ts-14-30) (meeting_scheduled ts-15-00) (meeting_scheduled ts-15-30) (meeting_scheduled ts-16-00)))
      )
    :effect
      (meeting_scheduled ?t)
  )

  (:action schedule_meeting_lauren
    :parameters (?t - time-slot)
    :precondition 
      (and 
        (available lauren ?t)
        (available kathryn ?t)
        (available charlotte ?t)
        (not (meeting_scheduled ?t))
      )
    :effect
      (meeting_scheduled ?t)
  )
)