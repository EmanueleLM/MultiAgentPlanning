(define (domain meeting_schedule_monday_earliest)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (before ?s1 - slot ?s2 - slot)
    (jointly_feasible ?s - slot)
    (earlier_jointly_feasible ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting_at_slot
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (jointly_feasible ?s)
      (not (earlier_jointly_feasible ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (not (unscheduled ?m))
    )
  )
)