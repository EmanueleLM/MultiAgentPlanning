(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types participant time_slot)
  (:predicates 
    (available ?p - participant ?s - time_slot)
    (meeting_time ?s1 - time_slot ?s2 - time_slot)
    (consecutive ?s1 - time_slot ?s2 - time_slot)
  )
  (:action schedule_meeting
    :parameters (?s1 - time_slot ?s2 - time_slot)
    :precondition (and 
      (available julie ?s1) 
      (available sean ?s1)
      (available lori ?s1)
      (available julie ?s2)
      (available sean ?s2)
      (available lori ?s2)
      (consecutive ?s1 ?s2)
    )
    :effect (and 
      (meeting_time ?s1 ?s2)
    )
  )
)