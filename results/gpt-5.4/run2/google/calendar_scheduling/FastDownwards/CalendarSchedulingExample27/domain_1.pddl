(define (domain meeting_scheduler_monday_specific)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    jesse kathryn megan - participant
  )

  (:predicates
    (current_slot ?t - timeslot)
    (next_slot ?from - timeslot ?to - timeslot)
    (free ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_scheduled)
  )

  (:action advance
    :parameters (?from - timeslot ?to - timeslot)
    :precondition (and
      (current_slot ?from)
      (next_slot ?from ?to)
      (not (meeting_scheduled))
    )
    :effect (and
      (not (current_slot ?from))
      (current_slot ?to)
    )
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (current_slot ?t)
      (free jesse ?t)
      (free kathryn ?t)
      (free megan ?t)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting_scheduled)
    )
  )
)