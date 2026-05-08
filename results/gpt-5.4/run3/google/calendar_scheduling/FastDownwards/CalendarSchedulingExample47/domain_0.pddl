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
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
    (meeting_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (not (scheduled))
      (next_slot ?start ?next)
      (free david ?start)
      (free david ?next)
      (free eric ?start)
      (free eric ?next)
      (free roger ?start)
      (free roger ?next)
    )
    :effect (and
      (scheduled)
      (meeting_start ?start)
    )
  )
)