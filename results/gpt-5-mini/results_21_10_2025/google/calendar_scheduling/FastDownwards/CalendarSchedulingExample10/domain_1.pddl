(define (domain meeting-scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  ;; Action remains associated with the orchestrator role
  (:action orchestrator-schedule
    :parameters (?s - slot)
    :precondition (and
      ;; All required participants must be available at the chosen slot
      (available diana ?s)
      (available ethan ?s)
      (available janet ?s)
      ;; Only schedule once
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)