(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (blocked ?p - participant ?s - slot)
    (work_slot ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (meeting_scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (unscheduled ?m)
      (work_slot ?s)
      (not (blocked arthur ?s))
      (not (blocked theresa ?s))
      (not (blocked carl ?s))
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting_scheduled ?m)
      (not (unscheduled ?m))
    )
  )
)