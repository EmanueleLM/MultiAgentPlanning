(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    david eric roger - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
    (meeting_uses ?s - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?start - slot ?end - slot)
    :precondition (and
      (not (meeting_scheduled))
      (next_slot ?start ?end)
      (available david ?start)
      (available david ?end)
      (available eric ?start)
      (available eric ?end)
      (available roger ?start)
      (available roger ?end)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?start)
      (meeting_uses ?start)
      (meeting_uses ?end)
    )
  )
)