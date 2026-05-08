(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants richard martha kimberly - person)
  (:predicates
    (available ?p - person ?s - slot)
    (is_scheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available richard ?s)
      (available martha ?s)
      (available kimberly ?s)
    )
    :effect (and
      (is_scheduled)
    )
  )
)