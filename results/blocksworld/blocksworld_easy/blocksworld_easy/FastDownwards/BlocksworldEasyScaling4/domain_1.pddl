(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (hand-empty)
    (holding ?x - block)
  )

  ;; Action 1: Pick up a block from the table (Pick)
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (hand-empty))
    :effect (and (not (ontable ?x)) (not (clear ?x)) (not (hand-empty)) (holding ?x))
  )

  ;; Action 2: Put down a block onto the table (Putdown)
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (not (holding ?x)) (clear ?x) (ontable ?x) (hand-empty))
  )

  ;; Action 3: Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (hand-empty)) (clear ?y) (holding ?x))
  )

  ;; Action 4: Stack a block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (on ?x ?y) (clear ?x) (hand-empty))
  )
)