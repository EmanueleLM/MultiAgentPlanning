(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (holding ?x - block)
    (hand-empty)
    (clear ?x - block)
    (succ ?s - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Picker: pick up a block from the table.
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

  ;; Picker: put down a held block onto the table.
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

  ;; Unstacker: remove a block ?x from on top of block ?y.
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

  ;; Stacker: place held block ?a onto block ?b.
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