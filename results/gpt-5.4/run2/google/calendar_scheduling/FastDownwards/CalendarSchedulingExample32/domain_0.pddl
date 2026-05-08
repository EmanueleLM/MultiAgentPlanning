(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:predicates
    (available ?p - participant ?t - timeslot)
    (allowed_slot ?t - timeslot)
    (selected ?t - timeslot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (scheduled))
      (allowed_slot ?t)
      (available emily ?t)
      (available melissa ?t)
      (available frank ?t)
    )
    :effect (and
      (scheduled)
      (selected ?t)
    )
  )
)