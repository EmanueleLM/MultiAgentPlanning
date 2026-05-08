(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants
    scott gabriel christine - person
  )
  (:predicates
    (free ?p - person ?s - slot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (free scott ?s)
      (free gabriel ?s)
      (free christine ?s)
    )
    :effect (scheduled)
  )
)