(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    alexander elizabeth walter - participant
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (chosen_slot ?s - slot)
    (meeting_scheduled)
  )

  (:action choose_meeting_slot
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy alexander ?s))
      (not (busy elizabeth ?s))
      (not (busy walter ?s))
    )
    :effect (and
      (chosen_slot ?s)
      (meeting_scheduled)
    )
  )
)