(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  ;; block is a subtype of support so blocks can serve as supports for other blocks
  (:types block - support support stage)

  (:predicates
    (on ?b - block ?s - support)        ;; block ?b is directly on support ?s (table or another block)
    (clear ?b - block)                  ;; no block on top of ?b (and it is not being held)
    (holding ?b - block)                ;; the hand holds block ?b
    (handempty)                         ;; the hand is empty
    (is-table ?s - support)             ;; identifies a table support object
    (current ?st - stage)               ;; the current discrete stage/timepoint
    (next ?st1 - stage ?st2 - stage)    ;; immediate successor relation over stages
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
      (not (clear ?b))
      (not (handempty))
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
      (clear ?s)
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Stacker: stack a held block ?b onto a clear destination block ?d (hand must be holding ?b).
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
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?d))
      (not (current ?st))
      (current ?st2)
    )
  )
)