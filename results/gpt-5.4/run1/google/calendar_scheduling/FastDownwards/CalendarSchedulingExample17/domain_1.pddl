(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    margaret donna helen - participant
  )

  (:predicates
    (next_slot ?from - slot ?to - slot)
    (available ?p - participant ?s - slot)
    (allowed_for_meeting ?s - slot)
    (current_slot ?s - slot)
    (meeting_scheduled ?s - slot)
    (scheduled)
  )

  (:action advance
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (scheduled))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (current_slot ?s)
      (allowed_for_meeting ?s)
      (available margaret ?s)
      (available donna ?s)
      (available helen ?s)
      (not (scheduled))
    )
    :effect (and
      (meeting_scheduled ?s)
      (scheduled)
    )
  )
)