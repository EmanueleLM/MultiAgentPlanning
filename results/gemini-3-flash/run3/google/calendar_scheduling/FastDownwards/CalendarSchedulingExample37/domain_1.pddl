(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants
    gregory teresa carol - person
  )
  (:predicates
    (busy ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (busy gregory ?t))
      (not (busy teresa ?t))
      (not (busy carol ?t))
    )
    :effect (meeting_scheduled)
  )
)