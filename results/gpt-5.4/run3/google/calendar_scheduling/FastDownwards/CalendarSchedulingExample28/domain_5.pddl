(define (domain calendar_scheduling_example28)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (required_participant ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (earlier ?s1 - slot ?s2 - slot)
    (scheduled ?m - meeting)
    (scheduled_in ?m - meeting ?s - slot)
    (blocked_by_earlier_choice ?m - meeting ?s - slot)
  )

  (:action block_later_slot
    :parameters (?m - meeting ?chosen - slot ?later - slot)
    :precondition (and
      (scheduled_in ?m ?chosen)
      (earlier ?chosen ?later)
      (not (blocked_by_earlier_choice ?m ?later))
    )
    :effect (blocked_by_earlier_choice ?m ?later)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      (required_participant ?m brittany)
      (required_participant ?m emily)
      (required_participant ?m doris)
      (free brittany ?s)
      (free emily ?s)
      (free doris ?s)
      (not (blocked_by_earlier_choice ?m ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_in ?m ?s)
    )
  )
)