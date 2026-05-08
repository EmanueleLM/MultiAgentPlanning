(define (domain calendar_scheduling_example6)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
    meeting
  )

  (:constants
    thomas dylan jerry - participant
  )

  (:predicates
    (required_attendee ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (scheduled_in ?m - meeting ?s - slot)
    (scheduled ?m - meeting)
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
      (not (scheduled ?m))
      (not (scheduled_in ?m ?s))
    )
    :effect (and
      (scheduled_in ?m ?s)
      (scheduled ?m)
    )
  )
)