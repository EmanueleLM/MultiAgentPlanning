(define (domain calendar_scheduling_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants
    arthur theresa carl - person
  )
  (:predicates
    (is_busy ?p - person ?s - timeslot)
    (success)
  )
  (:action schedule_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (not (is_busy arthur ?s))
      (not (is_busy theresa ?s))
      (not (is_busy carl ?s))
    )
    :effect (success)
  )
)