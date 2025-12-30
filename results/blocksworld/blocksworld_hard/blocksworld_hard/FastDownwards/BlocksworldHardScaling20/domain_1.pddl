(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    block
  )
  
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )

  ; Pick up a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (on-table ?x) (hand-empty))
    :effect (and (not (on-table ?x)) (not (clear ?x)) (not (hand-empty)) (holding ?x))
  )

  ; Unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (not (on ?x ?y)) (not (clear ?x)) (not (hand-empty)) (holding ?x) (clear ?y))
  )

  ; Put down a block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (not (holding ?x)) (on-table ?x) (clear ?x) (hand-empty))
  )

  ; Stack a block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (not (holding ?x)) (not (clear ?y)) (on ?x ?y) (clear ?x) (hand-empty))
  )
)