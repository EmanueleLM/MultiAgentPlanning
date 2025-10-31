(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (attends-alice ?s - slot)
    (attends-bob ?s - slot)
    (attends-carol ?s - slot)
    (free-alice)
    (free-bob)
    (free-carol)
    (preferred-slot ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-set)
  )

  (:action alice-attend
    :parameters (?s - slot)
    :precondition (and (free-alice) (available alice ?s))
    :effect (and (attends-alice ?s) (not (free-alice)))
  )

  (:action bob-attend
    :parameters (?s - slot)
    :precondition (and (free-bob) (available bob ?s))
    :effect (and (attends-bob ?s) (not (free-bob)))
  )

  (:action carol-attend
    :parameters (?s - slot)
    :precondition (and (free-carol) (available carol ?s))
    :effect (and (attends-carol ?s) (not (free-carol)))
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and (not (meeting-set)) (attends-alice ?s) (attends-bob ?s) (attends-carol ?s) (preferred-slot ?s))
    :effect (and (meeting-scheduled ?s) (meeting-set))
  )
)