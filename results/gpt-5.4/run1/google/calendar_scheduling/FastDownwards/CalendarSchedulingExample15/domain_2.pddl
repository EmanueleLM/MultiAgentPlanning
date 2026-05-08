(define (domain calendar_scheduling_example15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (meeting_scheduled)
    (selected_slot ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (free joyce ?s)
      (free christine ?s)
      (free alexander ?s)
    )
    :effect (and
      (meeting_scheduled)
      (selected_slot ?s)
    )
  )
)