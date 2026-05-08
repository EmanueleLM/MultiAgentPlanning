(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    raymond billy donald - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_half_hour_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available raymond ?t)
      (available billy ?t)
      (available donald ?t)
    )
    :effect (meeting_scheduled)
  )
)