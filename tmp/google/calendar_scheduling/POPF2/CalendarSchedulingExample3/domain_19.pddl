(define (domain unified_schedule_meeting_fdp_fd)
  (:requirements :strips :adl :typing :equality)

  (:types 
    time_slot person
  )

  (:predicates
    (available ?person - person ?slot - time_slot)
    (meeting_scheduled ?slot - time_slot)
    (next ?slot1 ?slot2 - time_slot)
    (slot_compatible ?slot1 ?slot2 - time_slot)
    (proposed_slot ?person - person ?slot1 ?slot2 - time_slot)
    (all_agree ?slot1 ?slot2 - time_slot)
  )

  (:action propose_slot
    :parameters (?p1 - person ?p2 - person ?p3 - person ?slot1 ?slot2 - time_slot)
    :precondition (and
      (available ?p1 ?slot1)
      (available ?p2 ?slot1)
      (available ?p3 ?slot1)
      (next ?slot1 ?slot2)
      (slot_compatible ?slot1 ?slot2)
    )
    :effect (and
      (proposed_slot ?p1 ?slot1 ?slot2)
      (proposed_slot ?p2 ?slot1 ?slot2)
      (proposed_slot ?p3 ?slot1 ?slot2)
    )
  )

  (:action confirm_meeting
    :parameters (?slot1 ?slot2 - time_slot)
    :precondition (all_agree ?slot1 ?slot2)
    :effect (meeting_scheduled ?slot1)
  )

  (:action update_agreement
    :parameters (?slot1 ?slot2 - time_slot)
    :precondition (and
      (proposed_slot arthur ?slot1 ?slot2)
      (proposed_slot michael ?slot1 ?slot2)
      (proposed_slot samantha ?slot1 ?slot2)
    )
    :effect (all_agree ?slot1 ?slot2)
  )
)