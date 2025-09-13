(define (domain unified_schedule_meeting_strips)
  (:requirements :strips :adl :typing :equality)

  (:types 
    time_slot person
  )
  
  (:predicates
    (available ?person - person ?slot - time_slot)
    (meeting_scheduled ?slot - time_slot)
    (next ?slot1 ?slot2 - time_slot)
    (slot_assigned ?p1 ?p2 ?p3 - person ?slot - time_slot)
    (slot_compatible ?slot1 ?slot2 - time_slot) ; Precomputed time slot compatibility
  )

  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - person ?slot1 ?slot2 - time_slot)
    :precondition (and
      (available ?p1 ?slot1)
      (available ?p2 ?slot1)
      (available ?p3 ?slot1)
      (slot_compatible ?slot1 ?slot2) ; Ensure slots are consecutive and compatible
    )
    :effect (and
      (meeting_scheduled ?slot1)
      (not (available ?p1 ?slot1))
      (not (available ?p2 ?slot1))
      (not (available ?p3 ?slot1))
      (slot_assigned ?p1 ?p2 ?p3 ?slot1)
    )
  )
)