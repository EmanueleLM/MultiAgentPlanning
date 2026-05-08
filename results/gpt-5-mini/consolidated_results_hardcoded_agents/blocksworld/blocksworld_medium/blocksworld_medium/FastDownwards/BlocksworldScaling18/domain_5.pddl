(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (on ?b - block ?under - block)
    (on-table ?b - block)
    (clear ?b - block)
    ;; binds a required stacking (block onto target) to a specific phase
    (requires-phase ?b - block ?s - block ?p - phase)
    ;; which phase is currently active (exactly one active phase is enforced by action effects)
    (phase-active ?p - phase)
    ;; ordering between phases (successor relation)
    (next-phase ?p - phase ?q - phase)
  )

  ;; Pick up a clear block from the table into the agent's hand.
  (:action pickup-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (on-table ?b)
    )
    :effect (and
      (not (on-table ?b))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  ;; Unstack a clear block from on top of another block into the agent's hand.
  (:action unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
      (handempty ?ag)
      (clear ?b)
      (on ?b ?under)
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table.
  (:action putdown-table
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on-table ?b)
      (clear ?b)
    )
  )

  ;; Stack a held block onto a clear target block during the required phase.
  ;; This version handles the common case where the phase has a specified successor.
  ;; Executing the action deactivates the current phase and activates its successor.
  (:action stack-onto
    :parameters (?ag - agent ?b - block ?s - block ?p - phase ?q - phase)
    :precondition (and
      (holding ?ag ?b)
      (clear ?s)
      (requires-phase ?b ?s ?p)
      (phase-active ?p)
      (next-phase ?p ?q)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (phase-active ?p))
      (phase-active ?q)
    )
  )
)