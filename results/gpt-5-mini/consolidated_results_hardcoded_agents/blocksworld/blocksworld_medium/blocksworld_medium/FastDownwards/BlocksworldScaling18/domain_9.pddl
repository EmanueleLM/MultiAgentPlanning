(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (on ?b - block ?under - block)
    (on-table ?b - block)
    (clear ?b - block)
    ;; binds a required stacking (b onto s) to a specific phase
    (requires-phase ?b - block ?s - block ?p - phase)
    ;; current active phase (exactly one should be active at a time in the problem initial state)
    (phase-active ?p - phase)
    ;; ordering between phases (successor relation)
    (next-phase ?p - phase ?q - phase)
  )

  ;; Pick up a clear block from the table into the agent's hand.
  ;; Requires the named phase to be active; does not change phase.
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
  ;; Requires the named phase to be active; does not change phase.
  (:action unstack
    :parameters (?ag - agent ?b - block ?under - block ?ph - phase)
    :precondition (and
      (phase-active ?ph)
      (handempty ?ag)
      (clear ?b)
      (on ?b ?under)
      (not (on-table ?b))
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty ?ag))
      ;; the block that was underneath becomes clear
      (clear ?under)
      ;; the held block is not clear by definition
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table.
  ;; Requires the named phase to be active; does not change phase.
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

  ;; Stack a held block onto a clear target block.
  ;; This action is the only action that advances the active phase to its successor.
  ;; It enforces that a required stacking (b onto s) occurs in the bound current phase.
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
      ;; advance phase: deactivate current and activate its successor
      (not (phase-active ?ph))
      (phase-active ?phs)
    )
  )
)