(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (agreed ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
    (unscheduled)
  )

  (:action agree-nicole
    :parameters (?s - slot)
    :precondition (free nicole ?s)
    :effect (agreed nicole ?s)
  )

  (:action agree-christine
    :parameters (?s - slot)
    :precondition (free christine ?s)
    :effect (agreed christine ?s)
  )

  (:action agree-anna
    :parameters (?s - slot)
    :precondition (free anna ?s)
    :effect (agreed anna ?s)
  )

  (:action agree-terry
    :parameters (?s - slot)
    :precondition (free terry ?s)
    :effect (agreed terry ?s)
  )

  (:action agree-julie
    :parameters (?s - slot)
    :precondition (free julie ?s)
    :effect (agreed julie ?s)
  )

  (:action agree-abigail
    :parameters (?s - slot)
    :precondition (free abigail ?s)
    :effect (agreed abigail ?s)
  )

  (:action orchestrator-schedule
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (agreed nicole ?s)
      (agreed christine ?s)
      (agreed anna ?s)
      (agreed terry ?s)
      (agreed julie ?s)
      (agreed abigail ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
      (not (unscheduled))
    )
  )
)