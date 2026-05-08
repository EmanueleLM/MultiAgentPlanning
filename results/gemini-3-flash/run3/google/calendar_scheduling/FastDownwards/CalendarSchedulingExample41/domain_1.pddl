(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person
    timeslot
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_half_hour_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free alan ?t)
      (free nancy ?t)
      (free patricia ?t)
    )
    :effect (meeting_scheduled)
  )
)