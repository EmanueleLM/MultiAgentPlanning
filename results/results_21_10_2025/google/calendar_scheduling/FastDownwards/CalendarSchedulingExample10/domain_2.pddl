(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:constants diana ethan janet - person)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action orchestrator-schedule
    :parameters (?s - slot)
    :precondition (and
      (available diana ?s)
      (available ethan ?s)
      (available janet ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)