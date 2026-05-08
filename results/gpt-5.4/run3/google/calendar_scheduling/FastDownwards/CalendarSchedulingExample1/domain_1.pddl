(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    raymond billy donald - participant
  )

  (:predicates
    (free ?p - participant ?t - timeslot)
    (preferred_slot ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_unscheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (meeting_unscheduled)
      (preferred_slot ?t)
      (free raymond ?t)
      (free billy ?t)
      (free donald ?t)
    )
    :effect (and
      (not (meeting_unscheduled))
      (scheduled ?t)
    )
  )
)