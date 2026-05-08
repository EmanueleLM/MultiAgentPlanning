(define (domain blocks-picker)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)        ;; block ?x directly on block ?y
    (ontable ?x - block)              ;; block ?x directly on the table
    (holding ?x - block)              ;; agent is holding block ?x
    (hand-empty)                      ;; agent's hand is empty
    (clear ?x - block)                ;; nothing on top of block ?x (and it's not being held)
    (succ ?s - stage ?s2 - stage)     ;; successor relation between stages
    (at-stage ?s - stage)             ;; current global stage
  )

  ;; Pick up a block from the table (picker namespace).
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

  ;; Put down a held block onto the table (picker namespace).
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

  ;; Unstack block ?x from block ?y (picker namespace).
  (:action picker-unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty)
      (on ?x ?y)
      (clear ?x)
      (not (= ?x ?y))
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

  ;; Stack held block ?a onto block ?b (picker namespace).
  (:action picker-stack
    :parameters (?a - block ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?a)
      (clear ?b)
      (not (= ?a ?b))
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (on ?a ?b)
      (clear ?a)
      (hand-empty)
      (not (holding ?a))
      (not (clear ?b))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)