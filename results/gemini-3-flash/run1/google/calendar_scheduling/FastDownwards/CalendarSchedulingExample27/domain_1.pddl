(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (at_slot ?s - slot)
    (next ?s1 ?s2 - slot)
    (free_jesse ?s - slot)
    (free_kathryn ?s - slot)
    (free_megan ?s - slot)
    (meeting_scheduled)
  )

  ;; Advances the current time cursor to the next 30-minute slot.
  (:action advance_time
    :parameters (?s1 ?s2 - slot)
    :precondition (and (at_slot ?s1) (next ?s1 ?s2))
    :effect (and (not (at_slot ?s1)) (at_slot ?s2))
  )

  ;; Schedules the meeting at the current time slot if all participants are free.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s) 
      (free_jesse ?s) 
      (free_kathryn ?s) 
      (free_megan ?s)
    )
    :effect (meeting_scheduled)
  )
)