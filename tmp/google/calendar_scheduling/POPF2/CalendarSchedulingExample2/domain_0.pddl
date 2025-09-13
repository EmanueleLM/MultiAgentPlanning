(define (domain meeting-scheduling)
  (:requirements :strips :typing)

  (:types time_slot person)

  (:predicates 
    (free ?p - person ?ts - time_slot)
    (conflict ?p - person ?ts - time_slot)
    (scheduled ?ts - time_slot)
    (preferred ?p - person ?ts - time_slot)
    (scheduled-with-preference ?p - person)
  )

  (:action schedule-meeting
    :parameters (?ts - time_slot ?p - person)
    :precondition (and 
      (free ?p ?ts)
      (not (conflict ?p ?ts))
    )
    :effect (and
      (scheduled ?ts)
      (when (preferred ?p ?ts) (scheduled-with-preference ?p))
    )
  )
)