(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (current_slot ?s - slot)
    (next_slot ?from - slot ?to - slot)
    (busy ?p - participant ?s - slot)
    (blocked_for_meeting ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action advance
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (blocked_for_meeting ?from)
      (not (meeting_scheduled))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (current_slot ?s)
      (not (meeting_scheduled))
      (not (busy ?p1 ?s))
      (not (busy ?p2 ?s))
      (not (busy ?p3 ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
    )
  )
)