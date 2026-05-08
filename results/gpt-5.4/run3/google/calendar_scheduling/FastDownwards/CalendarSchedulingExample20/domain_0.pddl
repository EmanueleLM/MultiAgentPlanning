(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    meeting
    slot
  )

  (:predicates
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
    (feasible_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (feasible_start ?s)
      (not (scheduled ?m))
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)