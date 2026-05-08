(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants
    adam jerry matthew - person
  )
  (:predicates
    (is_busy ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (is_busy adam ?t))
      (not (is_busy jerry ?t))
      (not (is_busy matthew ?t))
    )
    :effect (meeting_scheduled)
  )
)