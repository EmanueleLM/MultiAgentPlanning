(define (domain calendar_scheduling_example24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (required ?m - meeting ?p - participant)
    (free ?p - participant ?s - timeslot)
    (allowed_start ?m - meeting ?s - timeslot)
    (scheduled_at ?m - meeting ?s - timeslot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?p1 - participant ?p2 - participant ?p3 - participant ?s - timeslot)
    :precondition (and
      (unscheduled ?m)
      (allowed_start ?m ?s)
      (required ?m ?p1)
      (required ?m ?p2)
      (required ?m ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (= ?p1 ?p2))
      (not (= ?p1 ?p3))
      (not (= ?p2 ?p3))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (not (unscheduled ?m))
    )
  )
)