(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    richard martha kimberly - person
  )
  (:predicates
    (is_available ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (is_available richard ?s)
      (is_available martha ?s)
      (is_available kimberly ?s)
    )
    :effect (meeting_scheduled)
  )
)