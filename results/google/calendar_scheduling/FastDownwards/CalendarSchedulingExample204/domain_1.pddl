(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-at ?s - slot)
    (attends ?a - agent ?s - slot)
    (unscheduled)
  )
  (:action schedule
    :parameters (?s - slot)
    :precondition (unscheduled)
    :effect (and
      (not (unscheduled))
      (meeting-at ?s)
    )
  )
  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (and
      (meeting-at ?s)
      (free ?a ?s)
    )
    :effect (and
      (attends ?a ?s)
      (not (free ?a ?s))
    )
  )
)