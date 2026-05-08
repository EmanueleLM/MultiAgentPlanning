(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    meeting
    timeslot
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (scheduled_first ?m - meeting ?t - timeslot)
    (scheduled_second ?m - meeting ?t - timeslot)
    (meeting_started ?m - meeting)
    (meeting_completed ?m - meeting)
    (unscheduled ?m - meeting)
  )

  (:action start_meeting
    :parameters (?m - meeting ?t1 - timeslot)
    :precondition (and
      (unscheduled ?m)
      (free jacob ?t1)
      (free gabriel ?t1)
      (free matthew ?t1)
    )
    :effect (and
      (scheduled_first ?m ?t1)
      (meeting_started ?m)
      (not (unscheduled ?m))
    )
  )

  (:action extend_meeting
    :parameters (?m - meeting ?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (meeting_started ?m)
      (scheduled_first ?m ?t1)
      (next_slot ?t1 ?t2)
      (free jacob ?t2)
      (free gabriel ?t2)
      (free matthew ?t2)
      (not (meeting_completed ?m))
    )
    :effect (and
      (scheduled_second ?m ?t2)
      (meeting_completed ?m)
    )
  )
)