(define (domain blocks-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support stage)

  (:predicates
    (on ?b - block ?s - support)        ;; block ?b is directly on support ?s (table or a block)
    (clear ?b - block)                  ;; block ?b has nothing on top and is not being held
    (holding ?b - block)                ;; the single shared hand is holding block ?b
    (handempty)                         ;; the single shared hand is empty
    (is-table ?s - support)             ;; support ?s is the table (static fact supplied in problem)
    (current ?st - stage)               ;; which stage is currently active (exact single-stage progression)
    (next ?st1 - stage ?st2 - stage)    ;; static successor relation between stages
  )

  ;; Picker (agent: picker): pick a clear block from the table into the hand, advance to the next stage
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

  ;; Picker (agent: picker): put a held block down onto the table, advance to the next stage
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

  ;; Unstacker (agent: unstacker): unstack a clear block ?b from atop block ?s into the hand, advance to next stage
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
      (clear ?s)
      (not (on ?b ?s))
      (not (clear ?b))
      (not (handempty))
      (not (current ?st))
      (current ?st2)
    )
  )

  ;; Stacker (agent: stacker): stack a held block ?b onto a clear destination block ?d, advance to next stage
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