(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person timeslot)
  (:constants brandon jerry bradley - person)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
    (meeting_at ?t - timeslot)
    (preferred ?t - timeslot)
  )

  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (free brandon ?t)
      (free jerry ?t)
      (free bradley ?t)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_at ?t)
      (not (free brandon ?t))
      (not (free jerry ?t))
      (not (free bradley ?t))
    )
  )
)