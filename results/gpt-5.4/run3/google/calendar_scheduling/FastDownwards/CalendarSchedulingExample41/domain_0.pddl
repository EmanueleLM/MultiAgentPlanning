(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (attendee ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen_slot ?s - slot)
    (unscheduled)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free alan ?s)
      (free nancy ?s)
      (free patricia ?s)
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
      (not (unscheduled))
    )
  )
)