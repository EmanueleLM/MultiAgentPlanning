(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block - support support stage)

  (:predicates
    (on ?b - block ?s - support)     ; block ?b is directly on support ?s (table or another block)
    (clear ?b - block)               ; no block on top of ?b and ?b is not being held
    (holding ?b - block)             ; hand holds block ?b
    (handempty)                      ; the hand is empty
    (is-table ?s - support)          ; identifies a table support object
    (current ?st - stage)            ; current discrete stage/timepoint
    (next ?st1 - stage ?st2 - stage) ; immediate successor relation over stages
  )

  ;; Picker (agent: picker): pick up a clear block from the table. Requires hand empty.
  ;; Advances the global discrete stage by one (contiguous progression enforced).
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
      (not (clear ?b))
      (not (handempty))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Picker (agent: picker): put a held block down onto the table. Requires holding the block.
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

  ;; Unstacker (agent: unstacker): unstack a clear block ?b from on top of another block ?s. Requires hand empty.
  ;; Advances the global discrete stage by one. The block under becomes clear.
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
      (clear ?s)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Stacker (agent: stacker): stack a held block ?b onto a clear destination block ?d. Requires holding the block.
  ;; Advances the global discrete stage by one. Destination becomes not clear; placed block becomes clear.
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
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?d))
      (not (current ?st))
      (current ?st2)
    )
  )
)