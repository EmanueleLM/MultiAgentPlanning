(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:constants
    katherine nicole kevin - participant
  )

  (:predicates
    (available ?p - participant ?s - timeslot)
    (consecutive ?s1 - timeslot ?s2 - timeslot)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - timeslot)
    (occupies ?m - meeting ?s - timeslot)
    (unscheduled ?m - meeting)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s1 - timeslot ?s2 - timeslot)
    :precondition (and
      (unscheduled ?m)
      (consecutive ?s1 ?s2)
      (available katherine ?s1)
      (available katherine ?s2)
      (available nicole ?s1)
      (available nicole ?s2)
      (available kevin ?s1)
      (available kevin ?s2)
    )
    :effect (and
      (scheduled ?m)
      (scheduled_at ?m ?s1)
      (occupies ?m ?s1)
      (occupies ?m ?s2)
      (not (unscheduled ?m))
    )
  )
)