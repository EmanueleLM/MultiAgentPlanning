(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person slot)
  (:constants
    teresa kathleen patricia - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (preferred ?s - slot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free teresa ?s)
      (free kathleen ?s)
      (free patricia ?s)
      (preferred ?s)
    )
    :effect (scheduled)
  )
)