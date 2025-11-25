(define (domain blocksworld-stages)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?b - block ?under - block)       ; block ?b is directly on block ?under
    (ontable ?b - block)                 ; block ?b is directly on the table
    (clear ?b - block)                   ; nothing is on top of ?b and it is not being held
    (holding ?b - block)                 ; the single hand is holding ?b
    (handempty)                          ; the single hand is empty
    (at-stage ?s - stage)                ; system is currently at stage ?s
    (next ?s1 - stage ?s2 - stage)       ; successor relation over stages (acyclic)
  )

  ;; Unstacker: Pick up a clear block from the table into the single hand.
  ;; Enforces contiguous stage progression using (at-stage ?s) and (next ?s ?s2).
  (:action unstacker-pickup-from-table
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (not (ontable ?b))
      (holding ?b)
      (not (handempty))
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstacker: Unstack a clear block from on top of another block into the single hand.
  (:action unstacker-unstack
    :parameters (?b - block ?under - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (handempty)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (holding ?b)
      (not (handempty))
      (clear ?under)
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stacker: Put down a held block onto the table.
  (:action stacker-put-down
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stacker: Stack a held block onto a clear block.
  (:action stacker-stack-on
    :parameters (?b - block ?target - block ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (holding ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding ?b))
      (handempty)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)