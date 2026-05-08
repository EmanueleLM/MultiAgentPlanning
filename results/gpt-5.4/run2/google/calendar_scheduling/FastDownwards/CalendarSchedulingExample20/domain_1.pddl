(define (domain meeting_scheduler_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    ralph peter daniel - participant
  )

  (:predicates
    (busy ?p - participant ?t - timeslot)
    (allowed ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (allowed ?t)
      (not (meeting_scheduled))
      (not (busy ralph ?t))
      (not (busy peter ?t))
      (not (busy daniel ?t))
    )
    :effect (and
      (scheduled ?t)
      (meeting_scheduled)
    )
  )
)