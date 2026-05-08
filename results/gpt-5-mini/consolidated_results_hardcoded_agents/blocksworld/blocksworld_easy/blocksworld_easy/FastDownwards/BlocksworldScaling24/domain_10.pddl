(define (domain one_hand_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)         ; ?x is on top of ?y
    (ontable ?x - block)               ; ?x is on the table
    (clear ?x - block)                 ; nothing on top of ?x and it is not held
    (holding ?x - block)               ; the single hand is holding ?x
    (hand-free)                        ; the single hand is free
    (different ?x - block ?y - block)  ; helper to prevent self-stacking (enumerated in problem)
    (at-stage ?s - stage)              ; current discrete stage (exactly one true initially and preserved)
    (next ?s - stage ?t - stage)       ; successor relation over stages (strict forward progression)
  )

  ;; Pick up a block from the table into the single hand, advancing to the immediate successor stage
  (:action pick-up-from-table
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-free)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?b)
      (not (hand-free))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Unstack a block from on top of another block into the single hand, advancing to the immediate successor stage
  (:action pick-up-from-block
    :parameters (?b - block ?support - block ?s - stage ?t - stage)
    :precondition (and
      (on ?b ?support)
      (clear ?b)
      (hand-free)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?b ?support))
      (clear ?support)
      (not (clear ?b))
      (holding ?b)
      (not (hand-free))
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Put the held block down onto the table, advancing to the immediate successor stage
  (:action put-down-to-table
    :parameters (?b - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (hand-free)
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )

  ;; Stack the held block onto another block, advancing to the immediate successor stage
  (:action stack-onto-block
    :parameters (?b - block ?target - block ?s - stage ?t - stage)
    :precondition (and
      (holding ?b)
      (clear ?target)
      (different ?b ?target)
      (at-stage ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?b ?target)
      (not (ontable ?b))
      (clear ?b)
      (not (holding ?b))
      (not (clear ?target))
      (hand-free)
      (not (at-stage ?s))
      (at-stage ?t)
    )
  )
)