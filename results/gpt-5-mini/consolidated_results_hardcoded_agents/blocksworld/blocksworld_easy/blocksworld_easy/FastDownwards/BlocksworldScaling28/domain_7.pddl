(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: 'support' is a supertype for surfaces that can support blocks (e.g. the table and blocks).
  ;; 'block' is declared as a subtype of 'support' so a block can be a support for another block.
  (:types support stage block - support)

  (:predicates
    ;; A block ?b is on support ?s (support may be the table or another block).
    (on ?b - block ?s - support)
    ;; A block ?b has nothing on top of it (and is not being held). Cleared/maintained by actions.
    (clear ?b - block)
    ;; The agent's hand is holding block ?b.
    (holding ?b - block)
    ;; The agent's hand is empty.
    (handempty)
    ;; Identifies the table support object(s).
    (is-table ?s - support)
    ;; Current stage/timepoint the world is in (discrete progression).
    (current ?st - stage)
    ;; Successor relation over stages: next ?st1 ?st2 means st2 is the immediate successor of st1.
    (next ?st1 - stage ?st2 - stage)
  )

  ;; Agent: picker - picks up a clear block that is on the table and puts a held block down to the table.
  ;; The action consumes the current stage and produces its immediate successor ensuring discrete time progression.
  (:action picker-pick-up-from-table
    :parameters (?b - block ?s - support ?st - stage ?st2 - stage)
    :precondition (and
      (on ?b ?s)
      (is-table ?s)
      (clear ?b)
      (handempty)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; Causal effects of picking up:
      (holding ?b)
      (not (on ?b ?s))
      ;; Block being held is no longer clear (held implies not clear).
      (not (clear ?b))
      ;; Hand is no longer empty
      (not (handempty))
      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  (:action picker-put-down-to-table
    :parameters (?b - block ?s - support ?st - stage ?st2 - stage)
    :precondition (and
      (holding ?b)
      (is-table ?s)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; Put the block on the table and make it clear (nothing on top).
      (on ?b ?s)
      (clear ?b)
      ;; Hand becomes empty; no longer holding.
      (handempty)
      (not (holding ?b))
      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Agent: unstacker - unstack a clear block from on top of another block.
  ;; Only applicable when the support is a block (so unstacking from the table is not allowed).
  (:action unstacker-unstack
    :parameters (?b - block ?s - block ?st - stage ?st2 - stage)
    :precondition (and
      ;; block ?b is on block ?s (so ?s must be a block)
      (on ?b ?s)
      ;; the block being removed must be clear and the hand empty
      (clear ?b)
      (handempty)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; After unstacking, the agent holds ?b and it's no longer on ?s and not clear.
      (holding ?b)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      ;; The support block ?s becomes clear because ?b was removed from on top of it.
      (clear ?s)
      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Agent: stacker - stack a held block onto another clear block.
  (:action stacker-stack-onto-block
    :parameters (?b - block ?d - block ?st - stage ?st2 - stage)
    :precondition (and
      ;; must be holding the block to be stacked
      (holding ?b)
      ;; destination block must be clear (nothing on top)
      (clear ?d)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      ;; Place ?b on ?d, make ?b clear (nothing on top), make destination not clear,
      ;; empty the hand and stop holding ?b.
      (on ?b ?d)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?d))
      ;; advance stage
      (not (current ?st))
      (current ?st2)
    )
  )
)