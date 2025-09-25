(define (domain multiagent-meeting)
  (:requirements :typing :strips :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (preferred ?s - slot)
    (scheduled ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
  )

  (:action brandon-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )

  (:action jerry-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )

  (:action bradley-schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting-scheduled)
    )
  )
)