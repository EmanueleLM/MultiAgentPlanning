(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (free ?p - participant ?s - timeslot)
    (work_slot ?s - timeslot)
    (selected ?m - meeting ?s - timeslot)
    (scheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - timeslot)
    :precondition
      (and
        (not (scheduled ?m))
        (work_slot ?s)
        (free donna ?s)
        (free john ?s)
        (free billy ?s)
      )
    :effect
      (and
        (scheduled ?m)
        (selected ?m ?s)
      )
  )
)