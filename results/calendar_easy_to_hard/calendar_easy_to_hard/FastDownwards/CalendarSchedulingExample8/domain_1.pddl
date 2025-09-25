(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )

  (:action agree-adam
    :parameters (?s - slot)
    :precondition (and (free adam ?s) (not (agreed adam ?s)))
    :effect (agreed adam ?s)
  )

  (:action agree-jerry
    :parameters (?s - slot)
    :precondition (and (free jerry ?s) (not (agreed jerry ?s)))
    :effect (agreed jerry ?s)
  )

  (:action agree-matthew
    :parameters (?s - slot)
    :precondition (and (free matthew ?s) (not (agreed matthew ?s)))
    :effect (agreed matthew ?s)
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and (agreed adam ?s) (agreed jerry ?s) (agreed matthew ?s) (not (scheduled ?s)))
    :effect (scheduled ?s)
  )
)