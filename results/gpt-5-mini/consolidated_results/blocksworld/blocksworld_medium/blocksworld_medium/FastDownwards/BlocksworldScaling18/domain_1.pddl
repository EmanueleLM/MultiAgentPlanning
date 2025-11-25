(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    ;; hand / holding
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)

    ;; spatial relations
    (on ?b - block ?under - block)    ;; block on another block
    (on-table ?b - block)             ;; block directly on the table
    (clear ?b - block)                ;; nothing on top of b

    ;; phased sequencing
    (requires-phase ?b - block ?s - block ?p - phase)  ;; placing b onto s requires phase p
    (phase-active ?p - phase)
    (phase-completed ?p - phase)
    (next-phase ?p - phase ?q - phase)
    (phase-trigger ?p - phase ?b - block)              ;; only block b can trigger completion of phase p
  )

  ;; Pick up a clear block from the table with an empty hand
  (:action pickup-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (handempty ?ag) (clear ?b) (on-table ?b))
    :effect (and
      (not (on-table ?b))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  ;; Unstack a clear top block from another block with an empty hand
  (:action unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and (handempty ?ag) (clear ?b) (on ?b ?under))
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty ?ag))
      (clear ?under)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown-table
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on-table ?b)
      (clear ?b)
    )
  )

  ;; Stack a held block onto another block. Restricted to block-support pairs that require the active phase.
  ;; This action also marks the current phase completed and activates the next phase.
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
      (phase-completed ?p)
      (not (phase-active ?p))
      (phase-active ?q)
    )
  )

  ;; Advance a phase to its next phase when a specific block (the phase trigger) is on the table.
  ;; This action gives a structural, non-token-based way to enforce that certain staging conditions
  ;; must hold (e.g., a particular block has been put on the table) before the next phase may begin.
  (:action advance-phase-by-trigger
    :parameters (?p - phase ?q - phase ?b - block)
    :precondition (and
      (phase-active ?p)
      (next-phase ?p ?q)
      (on-table ?b)
      (phase-trigger ?p ?b)
    )
    :effect (and
      (phase-completed ?p)
      (not (phase-active ?p))
      (phase-active ?q)
    )
  )
)