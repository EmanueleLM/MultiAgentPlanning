(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions)
  (:types agent slot)

  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    ;; agent ?a is free at time slot ?s
    (free ?a - agent ?s - slot)
    ;; agent ?a has agreed to hold the meeting at slot ?s
    (agreed ?a - agent ?s - slot)
    ;; meeting has been scheduled at slot ?s (final)
    (scheduled ?s - slot)
  )

  ;; Actions are kept distinct per agent, as requested.
  (:action agree-adam
    :parameters (?s - slot)
    :precondition (and (agent adam) (slot ?s) (free adam ?s) (not (agreed adam ?s)))
    :effect (agreed adam ?s)
  )

  (:action agree-jerry
    :parameters (?s - slot)
    :precondition (and (agent jerry) (slot ?s) (free jerry ?s) (not (agreed jerry ?s)))
    :effect (agreed jerry ?s)
  )

  (:action agree-matthew
    :parameters (?s - slot)
    :precondition (and (agent matthew) (slot ?s) (free matthew ?s) (not (agreed matthew ?s)))
    :effect (agreed matthew ?s)
  )

  ;; Finalize the meeting once all participants have agreed to the same slot.
  (:action finalize
    :parameters (?s - slot)
    :precondition (and (agreed adam ?s) (agreed jerry ?s) (agreed matthew ?s) (not (scheduled ?s)))
    :effect (scheduled ?s)
  )
)