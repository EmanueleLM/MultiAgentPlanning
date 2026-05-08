(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person slot
  )
  (:predicates
    (at_slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  ;; Move consideration to the next half-hour time slot
  (:action move_time
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and 
      (at_slot ?s1) 
      (next ?s1 ?s2)
    )
    :effect (and 
      (not (at_slot ?s1)) 
      (at_slot ?s2)
    )
  )

  ;; Schedule the meeting at the current time slot if all participants are available
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s)
      (available brittany ?s)
      (available emily ?s)
      (available doris ?s)
    )
    :effect (meeting_scheduled)
  )
)