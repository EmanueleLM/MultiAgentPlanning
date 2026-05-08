(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (available ?p - participant ?t - timeslot)
    (scheduled ?m - meeting)
    (chosen ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (available katherine ?t)
      (available nicole ?t)
      (available kevin ?t)
    )
    :effect (and
      (scheduled ?m)
      (chosen ?m ?t)
    )
  )
)