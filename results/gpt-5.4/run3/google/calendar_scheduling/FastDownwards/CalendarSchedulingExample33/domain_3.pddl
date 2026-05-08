(define (domain calendar_scheduling_example33)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    slot
  )

  (:predicates
    (attendee ?m - meeting ?p - participant)
    (free ?p - participant ?s - slot)
    (feasible ?m - meeting ?s - slot)
    (scheduled_at ?m - meeting ?s - slot)
    (done ?m - meeting)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (not (done ?m))
      (feasible ?m ?s)
      (attendee ?m ?p1)
      (attendee ?m ?p2)
      (attendee ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
    )
    :effect (and
      (done ?m)
      (scheduled_at ?m ?s)
    )
  )
)