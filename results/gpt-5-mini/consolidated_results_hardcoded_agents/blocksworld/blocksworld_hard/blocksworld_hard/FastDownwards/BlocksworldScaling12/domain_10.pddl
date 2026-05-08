(define (domain blocks-multi)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)
  (:predicates
    (handempty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Pick up a block from the table into the agent's hand.
  ;; Requires the block to be on the table, clear, and the agent's hand empty.
  ;; Consumes the current stage and advances to the successor stage (enforces ordered time).
  (:action pick_up
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a block from another block into the agent's hand.
  ;; Requires the block to be on the other block, be clear, and the agent's hand empty.
  ;; Leaving the lower block clear and advancing the stage.
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty ?ag)
      (current ?s)
      (succ ?s ?s2)
      ;; disallow unstacking a block from itself
      (not (= ?b ?c))
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty ?ag))
      (holding ?ag ?b)
      (clear ?c)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Put down a held block onto the table.
  ;; Requires the agent to be holding the block and advances the stage.
  (:action put_down
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (ontable ?b)
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block onto another clear block.
  ;; Requires the agent to be holding the block and the target block to be clear.
  ;; Advances the stage and makes the target block not clear.
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
      (current ?s)
      (succ ?s ?s2)
      ;; disallow stacking a block onto itself
      (not (= ?b ?c))
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (not (current ?s))
      (current ?s2)
    )
  )
)