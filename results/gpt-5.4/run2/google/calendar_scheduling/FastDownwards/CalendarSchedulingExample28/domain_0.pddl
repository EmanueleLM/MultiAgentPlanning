(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (participant_free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (current_slot ?s - slot)
    (scheduled_at ?s - slot)
    (meeting_scheduled)
  )

  (:action advance_because_brittany_busy
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled))
      (not (participant_free brittany ?from))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action advance_because_emily_busy
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled))
      (not (participant_free emily ?from))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action advance_because_doris_busy
    :parameters (?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled))
      (not (participant_free doris ?from))
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
      (not (meeting_scheduled))
      (participant_free brittany ?s)
      (participant_free emily ?s)
      (participant_free doris ?s)
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
    )
  )
)