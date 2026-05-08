(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    catherine michael alexander - participant
  )

  (:predicates
    (busy ?p - participant ?s - timeslot)
    (scheduled ?s - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy catherine ?s))
      (not (busy michael ?s))
      (not (busy alexander ?s))
    )
    :effect (and
      (scheduled ?s)
      (meeting_scheduled)
    )
  )
)