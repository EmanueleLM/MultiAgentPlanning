(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types support stage block - support)

  (:predicates
    ;; a block ?b is on some support ?s (support can be table or another block)
    (on ?b - block ?s - support)
    ;; nothing is on top of ?b (and it is not being held)
    (clear ?b - block)
    ;; hand holds ?b
    (holding ?b - block)
    ;; hand is empty
    (handempty)
    ;; identifies the table support object(s)
    (is-table ?s - support)
    ;; current discrete stage
    (current ?st - stage)
    ;; immediate successor relation over stages
    (next ?st1 - stage ?st2 - stage)
  )

  ;; Picker: pick up a clear block from the table (hand must be empty).
  ;; Advances the global discrete stage by one (requires current and next).
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
      (holding ?b)
      (not (on ?b ?s))
      ;; a held block is not clear
      (not (clear ?b))
      (not (handempty))
      ;; advance stage (enforce contiguous progression)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Picker: put a held block down onto the table (hand must be holding the block).
  ;; Advances the global discrete stage by one.
  (:action picker-put-down-to-table
    :parameters (?b - block ?s - support ?st - stage ?st2 - stage)
    :precondition (and
      (holding ?b)
      (is-table ?s)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Unstacker: unstack a clear block ?b from on top of another block ?s (hand must be empty).
  ;; ?s is typed as block (so unstacking from table is not applicable).
  ;; Advances the global discrete stage by one.
  (:action unstacker-unstack
    :parameters (?b - block ?s - block ?st - stage ?st2 - stage)
    :precondition (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      ;; removing ?b makes the support block ?s clear
      (clear ?s)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Stacker: stack a held block ?b onto a clear destination block ?d (hand must be holding ?b).
  ;; Destination is required to be a block (cannot stack onto table with this action).
  ;; Advances the global discrete stage by one.
  (:action stacker-stack-onto-block
    :parameters (?b - block ?d - block ?st - stage ?st2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?d)
      (current ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?b ?d)
      ;; after stacking, the placed block has nothing on top of it (until something else is stacked)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      ;; destination is no longer clear because ?b is on it
      (not (clear ?d))
      (not (current ?st))
      (current ?st2)
    )
  )
)