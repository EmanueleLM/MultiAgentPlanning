(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    ;; hand / holding
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)

    ;; spatial relations
    (on ?b - block ?under - block)    ;; block b directly on top of block under
    (on-table ?b - block)             ;; block directly on the table
    (clear ?b - block)                ;; nothing on top of b AND b is not being held

    ;; phased sequencing (explicit stage objects, no tokens or penalty actions)
    (requires-phase ?b - block ?s - block ?p - phase)  ;; stacking b onto s is allowed in phase p
    (phase-active ?p - phase)                           ;; which phase is currently active
    (phase-completed ?p - phase)                        ;; phase p has been completed
    (next-phase ?p - phase ?q - phase)                 ;; phase ordering: q follows p
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

  ;; Stack a held block onto another block. Strictly gated by the explicit phase required for the pair.
  ;; This action completes the current phase and activates its successor phase (no alternate shortcuts).
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
)