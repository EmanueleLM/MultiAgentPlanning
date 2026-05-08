(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types
    person timeslot
  )
  (:predicates
    (free ?p - person ?t - timeslot)
    (is_alan ?p - person)
    (is_nancy ?p - person)
    (is_patricia ?p - person)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?p1 ?p2 ?p3 - person ?t - timeslot)
    :precondition (and
      (is_alan ?p1)
      (is_nancy ?p2)
      (is_patricia ?p3)
      (free ?p1 ?t)
      (free ?p2 ?t)
      (free ?p3 ?t)
    )
    :effect (meeting_scheduled)
  )
)