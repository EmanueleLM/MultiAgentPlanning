(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (required ?p - participant)
    (allowed_slot ?s - slot)
    (scheduled)
    (meeting_at ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (allowed_slot ?s)
      (required brian)
      (required billy)
      (required patricia)
      (not (busy brian ?s))
      (not (busy billy ?s))
      (not (busy patricia ?s))
    )
    :effect (and
      (scheduled)
      (meeting_at ?s)
    )
  )
)