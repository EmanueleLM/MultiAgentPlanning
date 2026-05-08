(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    interval
    meeting
  )

  (:predicates
    (requires_participant ?m - meeting ?p - participant)
    (interval_slot1 ?i - interval ?s - slot)
    (interval_slot2 ?i - interval ?s - slot)
    (available ?p - participant ?s - slot)
    (allowed_interval ?m - meeting ?i - interval)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?i - interval)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?i - interval ?s1 - slot ?s2 - slot)
    :precondition
      (and
        (not (scheduled ?m))
        (allowed_interval ?m ?i)
        (interval_slot1 ?i ?s1)
        (interval_slot2 ?i ?s2)

        (requires_participant ?m janet)
        (available janet ?s1)
        (available janet ?s2)

        (requires_participant ?m rachel)
        (available rachel ?s1)
        (available rachel ?s2)

        (requires_participant ?m cynthia)
        (available cynthia ?s1)
        (available cynthia ?s2)
      )
    :effect
      (and
        (scheduled ?m)
        (scheduled_in ?m ?i)
      )
  )
)