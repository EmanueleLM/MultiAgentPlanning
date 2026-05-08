(define (domain calendar_scheduling_example33)
  (:requirements :strips :typing)

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
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (done ?m))
      (feasible ?m ?s)
      (free lisa ?s)
      (free bobby ?s)
      (free randy ?s)
      (attendee ?m lisa)
      (attendee ?m bobby)
      (attendee ?m randy)
    )
    :effect (and
      (done ?m)
      (scheduled_at ?m ?s)
    )
  )
)