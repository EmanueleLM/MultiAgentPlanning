(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    timeslot
  )

  (:constants
    scott gabriel christine - participant
  )

  (:predicates
    (required ?p - participant)
    (busy ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (required scott)
      (required gabriel)
      (required christine)
      (not (meeting_scheduled))
      (not (busy scott ?t))
      (not (busy gabriel ?t))
      (not (busy christine ?t))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?t)
    )
  )
)