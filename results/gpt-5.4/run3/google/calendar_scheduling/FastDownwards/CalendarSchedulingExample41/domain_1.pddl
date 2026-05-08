(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled)
    (chosen_slot ?s - slot)
    (unscheduled)
  )

  (:action schedule_meeting_at
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (unscheduled)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
      (not (unscheduled))
    )
  )
)