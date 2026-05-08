(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
    meeting
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting)
    (starts_at ?m - meeting ?t - timeslot)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition
      (and
        (unscheduled ?m)
        (next_slot ?t1 ?t2)
        (free david ?t1)
        (free david ?t2)
        (free debra ?t1)
        (free debra ?t2)
        (free kevin ?t1)
        (free kevin ?t2)
        (not (scheduled ?m))
      )
    :effect
      (and
        (scheduled ?m)
        (starts_at ?m ?t1)
        (not (unscheduled ?m))
      )
  )
)