(define (domain schedule_meeting_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    willie richard noah - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (meeting_unscheduled ?m - meeting)
    (meeting_half_scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
    (starts_at ?m - meeting ?s - slot)
    (occupies ?m - meeting ?s - slot)
  )

  (:action start_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (meeting_unscheduled ?m)
      (next_slot ?s1 ?s2)
      (free willie ?s1)
      (free richard ?s1)
      (free noah ?s1)
    )
    :effect (and
      (not (meeting_unscheduled ?m))
      (meeting_half_scheduled ?m ?s1)
      (starts_at ?m ?s1)
      (occupies ?m ?s1)
    )
  )

  (:action extend_meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (meeting_half_scheduled ?m ?s1)
      (next_slot ?s1 ?s2)
      (free willie ?s2)
      (free richard ?s2)
      (free noah ?s2)
    )
    :effect (and
      (not (meeting_half_scheduled ?m ?s1))
      (meeting_scheduled ?m)
      (occupies ?m ?s2)
    )
  )
)