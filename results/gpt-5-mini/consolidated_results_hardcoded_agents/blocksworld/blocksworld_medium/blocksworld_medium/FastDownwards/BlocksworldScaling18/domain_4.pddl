(define (domain blocksworld-phased)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent phase)

  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (on ?b - block ?under - block)
    (on-table ?b - block)
    (clear ?b - block)
    ;; relation saying stacking ?b onto ?s must occur during phase ?p
    (requires-phase ?b - block ?s - block ?p - phase)
    (phase-active ?p - phase)
    (phase-completed ?p - phase)
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
  ;; The requires-phase relation binds the (block,target) pair to the phase in which
  ;; that stacking must occur. Executing the action marks the current phase completed
  ;; and activates its successor phase (next-phase relation must exist).
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