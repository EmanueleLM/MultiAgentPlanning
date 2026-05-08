(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    arthur theresa carl - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (meeting_scheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available arthur ?s)
      (available theresa ?s)
      (available carl ?s)
    )
    :effect (meeting_scheduled)
  )
)