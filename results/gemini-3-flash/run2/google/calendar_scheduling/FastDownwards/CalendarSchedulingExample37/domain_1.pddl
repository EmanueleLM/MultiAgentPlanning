(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants
    gregory teresa carol - person
  )
  (:predicates
    (is_busy ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (is_busy gregory ?t))
      (not (is_busy teresa ?t))
      (not (is_busy carol ?t))
    )
    :effect (meeting_scheduled)
  )
)