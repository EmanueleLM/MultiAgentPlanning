(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (meeting_scheduled)
    (selected_slot ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (available alan ?s)
      (available nancy ?s)
      (available patricia ?s)
    )
    :effect (and
      (meeting_scheduled)
      (selected_slot ?s)
    )
  )
)