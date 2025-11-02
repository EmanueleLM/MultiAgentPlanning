(define (domain multiagent-meeting)
  (:requirements :typing :strips :negative-preconditions)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (preferred ?s - slot)
    (scheduled ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting_scheduled)
  )

  (:action brandon_schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting_scheduled)
    )
  )

  (:action jerry_schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting_scheduled)
    )
  )

  (:action bradley_schedule
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (preferred ?s)
      (not (meeting_scheduled))
    )
    :effect (and
      (scheduled ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (meeting_scheduled)
    )
  )
)