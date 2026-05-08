(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants gregory teresa carol - person)
  (:predicates
    (is_busy ?p - person ?ts - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?ts - timeslot)
    :precondition (and
      (not (is_busy gregory ?ts))
      (not (is_busy teresa ?ts))
      (not (is_busy carol ?ts))
    )
    :effect (meeting_scheduled)
  )
)