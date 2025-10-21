(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:constants alexander elizabeth walter - person)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
    (meeting_at ?t - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (free alexander ?t)
      (free elizabeth ?t)
      (free walter ?t)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?t)
    )
  )
)