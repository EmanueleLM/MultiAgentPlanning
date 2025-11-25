(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table support agent stage)
  ;; declare that blocks and the table are supports for the "on" relation
  ; Note: block and table are subtypes of support
  (:constants )

  (:predicates
    ;; block is on a support (another block or the table)
    (on ?b - block ?p - support)

    ;; no block is on top of this block and it is not held
    (clear ?b - block)

    ;; agent's hand is empty
    (handempty ?a - agent)

    ;; agent is holding a block
    (holding ?a - agent ?b - block)

    ;; current stage object
    (current ?s - stage)

    ;; successor relation between stages (s1 -> s2)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Unstack a block ?b from on top of another block ?under
  (:action unstack
    :parameters (?a - agent ?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      ;; ?b must currently be on ?under (so ?under is a support and a block)
      (on ?b ?under)

      ;; ?b must be clear (no block on top and not held)
      (clear ?b)

      ;; agent must have empty hand
      (handempty ?a)

      ;; temporal ordering: action executes at current stage and advances to next stage
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; remove the on relation between b and under
      (not (on ?b ?under))

      ;; agent now holds b and hand is not empty
      (holding ?a ?b)
      (not (handempty ?a))

      ;; under becomes clear because its top block was removed
      (clear ?under)

      ;; b is not clear while held
      (not (clear ?b))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Pick up a block ?b from the table ?t
  (:action pickup
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      ;; block must be on the table and be clear
      (on ?b ?t)
      (clear ?b)

      ;; agent's hand must be empty
      (handempty ?a)

      ;; temporal ordering
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; remove from table and hold
      (not (on ?b ?t))
      (holding ?a ?b)
      (not (handempty ?a))

      ;; block is not clear while held
      (not (clear ?b))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack block ?b onto another block ?target
  (:action stack
    :parameters (?a - agent ?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      ;; agent must be holding the block to place
      (holding ?a ?b)

      ;; target block must be clear (no block on top and not held)
      (clear ?target)

      ;; prevent stacking a block onto itself
      (not (= ?b ?target))

      ;; temporal ordering
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; place b on target and release hand
      (on ?b ?target)
      (handempty ?a)
      (not (holding ?a ?b))

      ;; target is no longer clear; the placed block becomes clear
      (not (clear ?target))
      (clear ?b)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down block ?b onto the table ?t
  (:action putdown
    :parameters (?a - agent ?b - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
      ;; agent must be holding the block
      (holding ?a ?b)

      ;; temporal ordering
      (current ?s)
      (next ?s ?s2)
      (not (current ?s2))
    )
    :effect (and
      ;; place block on the table and release hand
      (on ?b ?t)
      (handempty ?a)
      (not (holding ?a ?b))

      ;; block is clear after being put down (no block on top)
      (clear ?b)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)