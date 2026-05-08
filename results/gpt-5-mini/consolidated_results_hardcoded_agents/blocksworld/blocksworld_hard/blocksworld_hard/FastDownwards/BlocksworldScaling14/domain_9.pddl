(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)     ;; ?x is directly on ?y
    (ontable ?x - block)           ;; ?x is on the table
    (holding ?x - block)           ;; the agent is holding ?x
    (hand-empty)                   ;; the agent's hand is empty
    (clear ?x - block)             ;; no block is on ?x and ?x is not held
    (succ ?s - stage ?s2 - stage)  ;; successor relation for discrete stages
    (at-stage ?s - stage)          ;; current stage marker (exactly one true)
  )

  ;; Picker: pick up a block from the table (advances stage by one).
  (:action picker-pickup
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty)
      (ontable ?b)
      (clear ?b)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?b)
      (not (hand-empty))
      (not (ontable ?b))
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Picker: put down a held block onto the table (advances stage by one).
  (:action picker-putdown
    :parameters (?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?b)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (hand-empty)
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Unstacker: remove a clear block ?x from on top of block ?y (advances stage).
  (:action unstacker-unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty)
      (on ?x ?y)
      (clear ?x)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (hand-empty))
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Stacker: place a held block ?a onto a clear block ?b (advances stage).
  (:action stacker-stack
    :parameters (?a - block ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a)
      (clear ?b)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?a ?b)
      (clear ?a)
      (hand-empty)
      (not (holding ?a))
      (not (clear ?b))
      (not (ontable ?a))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)