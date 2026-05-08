(define (domain calendar_scheduling_example6)
  (:requirements :strips :typing)

  (:types
    participant
    slot
    meeting
  )

  (:predicates
    (required_attendee ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled_in ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (required_attendee ?m thomas)
      (required_attendee ?m dylan)
      (required_attendee ?m jerry)
      (free thomas ?s)
      (free dylan ?s)
      (free jerry ?s)
      (not (scheduled_in ?m ?s))
    )
    :effect (scheduled_in ?m ?s)
  )
)