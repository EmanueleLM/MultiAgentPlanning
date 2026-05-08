(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (chosen_slot ?s - slot)
  )

  (:action choose_meeting_slot
    :parameters (?s - slot)
    :precondition (and
      (not (chosen_slot ?s))
      (not (busy alexander ?s))
      (not (busy elizabeth ?s))
      (not (busy walter ?s))
    )
    :effect (chosen_slot ?s)
  )
)