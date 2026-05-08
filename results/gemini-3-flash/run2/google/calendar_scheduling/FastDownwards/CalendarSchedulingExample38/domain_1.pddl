(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (free_catherine ?s - slot)
    (free_michael ?s - slot)
    (free_alexander ?s - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule a half-hour meeting in a specific timeslot.
  ;; All participants must be free during that slot.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (free_catherine ?s) 
      (free_michael ?s) 
      (free_alexander ?s)
    )
    :effect (meeting_scheduled)
  )
)