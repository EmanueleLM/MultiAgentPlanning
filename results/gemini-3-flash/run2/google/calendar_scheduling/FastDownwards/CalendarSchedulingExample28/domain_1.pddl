(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)

  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (current_slot ?s - slot)
    (slot_available ?s - slot)
    (slot_unavailable ?s - slot)
    (meeting_scheduled)
  )

  (:action skip_to_next_slot
    :parameters (?s - slot ?sn - slot)
    :precondition (and (current_slot ?s) (next ?s ?sn) (slot_unavailable ?s))
    :effect (and (not (current_slot ?s)) (current_slot ?sn))
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and (current_slot ?s) (slot_available ?s))
    :effect (meeting_scheduled)
  )
)