(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing)
  (:types
    participant
    slot
  )

  (:constants
    emily victoria nancy - participant
  )

  (:predicates
    (current ?s - slot)
    (next ?from - slot ?to - slot)
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (open)
  )

  (:action advance_cursor
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (open)
      (current ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (open)
      (current ?s)
      (free emily ?s)
      (free victoria ?s)
      (free nancy ?s)
    )
    :effect (and
      (scheduled ?s)
      (not (open))
    )
  )
)