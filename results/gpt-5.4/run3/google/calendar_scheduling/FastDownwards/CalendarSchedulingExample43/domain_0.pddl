(define (domain meeting_schedule_monday_earliest)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (current_slot ?s - slot)
    (next_slot ?from - slot ?to - slot)
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
      (not (scheduled))
      (not (busy albert ?s))
      (not (busy gregory ?s))
      (not (busy benjamin ?s))
    )
    :effect (and
      (scheduled)
    )
  )
)