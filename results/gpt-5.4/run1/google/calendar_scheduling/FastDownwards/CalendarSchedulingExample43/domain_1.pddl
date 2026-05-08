(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    albert gregory benjamin - participant
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (next_slot ?t1 - timeslot ?t2 - timeslot)
    (candidate ?t - timeslot)
    (current ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_set)
  )

  (:action advance_current
    :parameters (?t - timeslot ?u - timeslot)
    :precondition (and
      (current ?t)
      (candidate ?t)
      (next_slot ?t ?u)
      (candidate ?u)
      (not (meeting_set))
    )
    :effect (and
      (not (current ?t))
      (not (candidate ?t))
      (current ?u)
    )
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (current ?t)
      (candidate ?t)
      (free albert ?t)
      (free gregory ?t)
      (free benjamin ?t)
      (not (meeting_set))
    )
    :effect (and
      (scheduled ?t)
      (meeting_set)
    )
  )
)