(define (domain unified_schedule_meeting)
  (:requirements :strips :typing)

  (:types 
    time_slot person
  )
  
  (:predicates
    (available ?person - person ?slot - time_slot)
    (meeting_scheduled ?slot - time_slot)
    (next ?slot1 ?slot2 - time_slot)
    (slot_assigned ?p1 ?p2 ?p3 - person ?slot - time_slot)
  )

  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - person ?slot - time_slot)
    :precondition (and
      (available ?p1 ?slot)
      (available ?p2 ?slot)
      (available ?p3 ?slot)
    )
    :effect (and
      (meeting_scheduled ?slot)
      (not (available ?p1 ?slot))
      (not (available ?p2 ?slot))
      (not (available ?p3 ?slot))
      (slot_assigned ?p1 ?p2 ?p3 ?slot)
    )
  )
)