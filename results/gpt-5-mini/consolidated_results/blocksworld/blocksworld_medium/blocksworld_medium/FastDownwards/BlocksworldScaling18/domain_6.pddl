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
    ;; which phase is currently active (exactly one active phase is enforced by initial state
    ;; and only the stack action transitions between phases)
    (phase-active ?p - phase)
    ;; ordering between phases (successor relation)
    (next-phase ?p - phase ?q - phase)
  )

  ;; Pick up a clear block from the table into the agent's hand.
  ;; This action is only allowed when some phase is active; the phase parameter
  ;; enforces that actions are constrained to the current active stage.
  (:action pickup-table
    :parameters (?ag - agent ?b - block ?ph - phase)
    :precondition (and
      (phase-active ?ph)
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
    :parameters (?ag - agent ?b - block ?under - block ?ph - phase)
    :precondition (and
      (phase-active ?ph)
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
    :parameters (?ag - agent ?b - block ?ph - phase)
    :precondition (and
      (phase-active ?ph)
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
  ;; This action enforces that the specific required stacking (b onto s) occurs
  ;; only when the bound phase ?ph is active, and it advances the active phase
  ;; to its successor ?phs.
  (:action stack-onto
    :parameters (?ag - agent ?b - block ?s - block ?ph - phase ?phs - phase)
    :precondition (and
      (phase-active ?ph)
      (holding ?ag ?b)
      (clear ?s)
      (requires-phase ?b ?s ?ph)
      (next-phase ?ph ?phs)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?s)
      (not (clear ?s))
      (clear ?b)
      (not (phase-active ?ph))
      (phase-active ?phs)
    )
  )
)