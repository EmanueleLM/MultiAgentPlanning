(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (current_slot ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
    (checked ?s - slot)
    (prior ?earlier - slot ?later - slot)
  )

  (:action reject_current_slot
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (current_slot ?s)
      (not (meeting_scheduled ?m))
      (not (free jesse ?s))
    )
    :effect (and
      (checked ?s)
    )
  )

  (:action reject_current_slot_kathryn
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (current_slot ?s)
      (not (meeting_scheduled ?m))
      (not (free kathryn ?s))
    )
    :effect (and
      (checked ?s)
    )
  )

  (:action reject_current_slot_megan
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (current_slot ?s)
      (not (meeting_scheduled ?m))
      (not (free megan ?s))
    )
    :effect (and
      (checked ?s)
    )
  )

  (:action advance_to_next_slot
    :parameters (?m - meeting ?from - slot ?to - slot)
    :precondition (and
      (current_slot ?from)
      (checked ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled ?m))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (current_slot ?s)
      (not (meeting_scheduled ?m))
      (required ?m jesse)
      (required ?m kathryn)
      (required ?m megan)
      (free jesse ?s)
      (free kathryn ?s)
      (free megan ?s)
      (not (exists_prior_unchecked_schedulable ?m ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
    )
  )
)